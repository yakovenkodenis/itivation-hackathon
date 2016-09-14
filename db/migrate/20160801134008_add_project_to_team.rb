class AddProjectToTeam < ActiveRecord::Migration
  def change
    add_reference :projects, :team, index: true, foreign_key: true
  end
end
