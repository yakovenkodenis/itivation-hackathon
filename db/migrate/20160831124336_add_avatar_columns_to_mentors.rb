class AddAvatarColumnsToMentors < ActiveRecord::Migration
  def change
    add_attachment :mentors, :avatar
  end
end
