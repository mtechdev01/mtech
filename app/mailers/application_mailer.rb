class ApplicationMailer < ActionMailer::Base
  default from: "notification@meusetech.com"
  layout 'mailer'
end