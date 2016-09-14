class Contact < MailForm::Base
  attribute :name,     validate: true
  attribute :email,    validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,  validate: true
  attribute :nickname, captcha: true

  append :remote_ip, :user_agent, :session

  def headers
    {
      subject: 'Itivation Question',
      to: ENV['ACTION_MAILER_USERNAME'],
      from: %("#{name}" <#{email}>)
    }
  end
end
