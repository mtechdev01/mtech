class Admin::NewslettersController < Admin::AdminController

  def index
    @members = Newsletter.all
  end
 
  def destroy
    @member = Newsletter.find(params[:id])
      if @member != nil
      @member.destroy 
      flash[:notice] ="Ce membre a été supprimé"
      flash[:class] = "success"
      redirect_to :back
    else
      flash[:notice] ="Ce membre est inexistant"
      flash[:class] = "danger"
      redirect_to :back
    end
  end


  def nwsletterexport
    @newsletters = Newsletter.all
    respond_to do |format|
      format.html
      format.csv { send_data @newsletters.to_csv, filename: "newsletters-#{Date.today}.csv" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:email)
    end
end
