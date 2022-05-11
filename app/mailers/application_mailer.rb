class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper

  default :from =>  "Zwiggy@gmail.com"
  layout 'mailer'
end
