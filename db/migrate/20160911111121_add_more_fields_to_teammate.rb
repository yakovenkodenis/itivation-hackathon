class AddMoreFieldsToTeammate < ActiveRecord::Migration
  def change
    add_column :teammates, :phone_number, :string
    add_column :teammates, :occupation, :string
    add_column :teammates, :work_place, :string
    add_column :teammates, :vk, :string
    add_column :teammates, :facebook, :string
    add_column :teammates, :linkedin, :string
    add_column :teammates, :team_role, :string
    add_column :teammates, :found_from, :string
  end
end
