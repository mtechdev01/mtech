class AdminMailer < ApplicationMailer
  
  def new_project(admin, project)
    @receiver = admin
    @project = project
    @subject = "Un nouveau projet a été créé! \"#{@project.name}\", pensez à le mettre en ligne!"
    mail(to: @receiver.email, subject: @subject)
  end
    
end
