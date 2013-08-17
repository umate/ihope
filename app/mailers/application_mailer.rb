class ApplicationMailer < ActionMailer::Base
  default :from => 'notifications@example.com'

  def contact_form_email(user_data)
    @user_data = user_data
    mail(to: to, subject:  'example.com / New order from the contact form')
  end
end
