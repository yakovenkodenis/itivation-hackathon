class Contact < MailForm::Base
  attribute :name,    validate: true
  attribute :email,   validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname, captcha: true

  def headers
    {
      subject: 'Itivation Question',
      to: ENV['ACTION_MAILER_USERNAME'],
      from: %("#{name}" <#{email}>)
    }
  end
end
