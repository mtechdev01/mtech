class SurveyMailer < ApplicationMailer

  def survey_end(user, survey)
    @receiver = user
    @survey = survey
    @subject = "Le sondage suivant \"#{@survey.name}\" vient de se terminer!"
    attachments["sondage_#{@survey.title}.pdf"] = File.read("#{Rails.root}/public/uploads/survey/#{@survey.id}/*.pdf")
    mail(to: @receiver.email, subject: @subject)
  end
end
