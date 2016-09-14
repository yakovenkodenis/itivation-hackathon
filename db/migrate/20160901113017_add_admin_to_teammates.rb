class AddAdminToTeammates < ActiveRecord::Migration
  def change
    add_column :teammates, :admin, :boolean, default: false
  end
end
