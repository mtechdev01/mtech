class Admin::SurveysController < Admin::AdminController

  def index
    @surveys = Survey.all
  end

  def show
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
      @statsResponse[index] = { :label     => field.question, :rsp => Array.new }
      @Allresponses.each do | response |
        if field.options
          if !field.options.empty?
            @rspFormatted = field.optionsFormated[response.response.to_i]
          else
            @rspFormatted = response.response.to_s
          end
        else
          @rspFormatted = response.response.to_s
        end
        @statsResponse[index][:rsp] << {
          :response  => @rspFormatted,
          :responded => SurveysResponse.where( surveys_field_id: field.id, response: response.response.to_s ).count(:all),
          :max       => @CountResponse
        }
      end
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      flash[:notice] = "La mise à jour à été effectuée"
      flash[:class]= "success"
      redirect_to admin_surveys_url
    else
      flash[:notice] = "Erreur lors de la mise à jour"
      flash[:class]= "danger"
      redirect_to :back
    end
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new
    if request.post?
      @survey = Survey.new survey_params
      if @survey.valid?
        if @survey.save
          flash[:notice] ="Votre sondage a été ajouté."
          flash[:class] ="success"
          redirect_to admin_AddQuestion_path( @survey.id )
        else
          flash[:notice] = "Une erreur est survenue lors de l'ajout de votre sondage"
          flash[:class] = "danger"
          redirect_to :back
        end
      else
        flash[:notice] = "Formulaire invalide"
        flash[:class]= "danger"
      end
    end
  end

  def delete
    if params[:id]
      @survey = Survey.find(params[:id])
      if @survey
        if @survey.destroy!
          flash[:notice] ="Votre sondage a été supprimé."
          flash[:class] ="success"
          redirect_to admin_surveys_url
        else
          flash[:notice] = "Une erreur est survenue lors de la suppression de votre sondage"
          flash[:class] = "danger"
          redirect_to :back
        end
      else
        flash[:notice] = "Le sondage n'existe pas!"
        flash[:class] = "danger"
        redirect_to :back
      end
    end
  end

  def addquestion
    @survey = Survey.find(params[:id])
    @field = SurveysField.new
    if request.post?
      @field = SurveysField.new field_params
      @field.survey = @survey
      if @field.valid?
        if @field.save
          flash[:notice] ="Votre question a été ajouté."
          flash[:class] ="success"
          @field = nil
          redirect_to admin_AddQuestion_path
        else
          flash[:notice] = "Une erreur est survenue lors de l'ajout de votre sondage"
          flash[:class] = "danger"
          redirect_to :back
        end
      else
        flash[:notice] = "Formulaire invalide"
        flash[:class]= "danger"
      end
    end
  end

  def editquestion
    @surveyFields = SurveysField.find( params[:id] )
  end

  def updatequestion
    if params[:id]
      @surveyFields = SurveysField.find( params[:id] )
      if @surveyFields.update_attributes( field_params )
        flash[:notice] = "La mise à jour à été effectuée"
        flash[:class]= "success"
        redirect_to admin_surveys_url
      else
        flash[:notice] = "Erreur lors de la mise à jour"
        flash[:class]= "danger"
        redirect_to :back
      end
    end
  end

  def deletequestion
    if params[:id]
      @surveyFields = SurveysField.find(params[:id])
      if @surveyFields
        if @surveyFields.destroy!
          flash[:notice] ="Votre question a été supprimé."
          flash[:class] ="success"
          redirect_to admin_surveys_url
        else
          flash[:notice] = "Une erreur est survenue lors de la suppression de votre question"
          flash[:class] = "danger"
          redirect_to :back
        end
      else
        flash[:notice] = "La question n'existe pas!"
        flash[:class] = "danger"
        redirect_to :back
      end
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description, :start_at, :end_at)
  end

  def field_params
    params.require(:surveyFields).permit(:question, :is_required, :input_type, :options, :rules)
  end
end
