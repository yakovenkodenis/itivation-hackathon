class AddCityToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :city, :string
  end
end
