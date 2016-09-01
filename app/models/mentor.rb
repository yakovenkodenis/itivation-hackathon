class Mentor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                     default_url: "/images/:style/missing.png",
                     url: '/system/:hash.:extension',
                     hash_secret: ENV['PAPERCLIP_HASH_SECRET']

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :name, :email, :organization, :city, presence: true
end
