class Team < ActiveRecord::Base
  has_many :projects
  has_many :teammates

  validates :name, presence: true
end
