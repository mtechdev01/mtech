class SurveysController < ApplicationController
  before_action :authenticate_user!, only: [:respond]

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    @usersResponded = SurveysResponse.hasResponsedTo current_user, @survey
    if @usersResponded
      flash[:notice] = "Vous avez déjà répondus au sondage"
      flash[:class]= "danger"
      redirect_to surveyStats_url( @survey.id )
    end
  end

  def stats
    @survey = Survey.find(params[:id])
    @usersResponded = Array.new
    SurveysResponse.where(survey_id: params[:id]).group(:user_id).find_each do | user |
      @usersResponded << User.find( user.user.id )
    end
    @userTotal = User.count
    @statsResponse = Array.new
    @survey.fields.each_with_index do | field, index |
      @CountResponse = SurveysResponse.where( surveys_field_id: field.id ).count(:all)
      @Allresponses = SurveysResponse.where( surveys_field_id: field.id ).group(:response)
      @statsResponse[index] = { :question => field.question, :rsp => Array.new }
      @Allresponses.each do | response |
        if field.options
          @rspFormatted = field.optionsFormated[response.response.to_i]
        else
          @rspFormatted = response.response
        end
        @statsResponse[index][:rsp] << {
          :response  => @rspFormatted,
          :responded => SurveysResponse.where( surveys_field_id: field.id, response: response.response.to_s ).count(:all),
          :max       => @CountResponse
        }
      end
    end
  end

  def reponse
    if request.post?
      @fields = params[:fields]
      @haveCheckbox = Array.new
      SurveysField.where(survey_id: @fields[:survey_id]).find_each do | field |
        if field.input_type == "checkbox"
          @haveCheckbox << field
        end
      end
      if @fields.size <= 1
        if @haveCheckbox.size > 0
          @haveCheckbox.each_with_index do | value, index |
            @response = SurveysResponse.new response_params
            @response.user_id = current_user.id
            @response.survey_id = @fields[:survey_id]
            @response.surveys_field_id = value.id
            @response.response = "non"
            @response.save
          end
          if @response.save
            flash[:notice] = "Votre sondage a bien été enregistré, merci pour votre participation."
            flash[:class]= "success"
            redirect_to surveyStats_url( @response.id )
          else
            flash[:notice] = "Une erreur est survenue."
            flash[:class]= "danger"
            redirect_to :back
          end
        end
      else
        @fields[:questions].each_with_index do | value, index |
          @response = SurveysResponse.new response_params
          @response.user_id = current_user.id
          @response.survey_id = @fields[:survey_id]
          @response.surveys_field_id = value[0]
          @response.response = value[1].to_s
          @response.save
          byebug

        end

        if @response.save
          flash[:notice] = "Votre sondage a bien été enregistré, merci pour votre participation."
          flash[:class]= "success"
          redirect_to surveyStats_url( @response.id )
        else
          flash[:notice] = "Une erreur est survenue."
          flash[:class]= "danger"
          redirect_to :back
        end
      end

    end
  end

  private
  def response_params
    params.require(:fields).permit(:survey_id,
    :surveys_field_id,
    :user_id,
    :responses)
  end

end
