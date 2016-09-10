class AddApprovedToMentor < ActiveRecord::Migration
  def change
    add_column :mentors, :approved, :boolean, default: false, null: false
    add_index :mentors, :approved
  end
end
