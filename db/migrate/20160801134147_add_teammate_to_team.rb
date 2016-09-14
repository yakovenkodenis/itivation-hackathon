class AddTeammateToTeam < ActiveRecord::Migration
  def change
    add_reference :teammates, :team, index: true, foreign_key: true
  end
end
