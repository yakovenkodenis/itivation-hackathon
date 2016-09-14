class AddAvatarColumnsToTeammates < ActiveRecord::Migration
  def change
    add_attachment :teammates, :avatar
  end
end
