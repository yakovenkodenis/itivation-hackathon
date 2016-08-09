class Teammate < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  belongs_to :team

  acts_as_taggable_on :technologies

  def send_devise_notification(notification, *args)
    puts 'SEND_DEVISE_NOTIFICATION'
    puts notification
    puts *args
    puts 'SEND_DEVISE_NOTIFICATION END'
    # devise_mailer.send(notification, self, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
