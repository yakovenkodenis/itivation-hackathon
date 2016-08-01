class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      t.string :name
      t.string :email
      t.string :city

      t.timestamps null: false
    end
  end
end
