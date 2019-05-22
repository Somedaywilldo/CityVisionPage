class ApplicationMailer < ActionMailer::Base 
  default from: "no-reply@hello.somedaywill.cn"
  layout 'mailer'
end