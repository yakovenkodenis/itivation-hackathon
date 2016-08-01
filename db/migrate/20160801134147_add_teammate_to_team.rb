class AddTeammateToTeam < ActiveRecord::Migration
  def change
    add_reference :teams, :teammate, index: true, foreign_key: true
  end
end
