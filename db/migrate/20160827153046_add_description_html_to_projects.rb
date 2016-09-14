class AddDescriptionHtmlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description_html, :text
  end
end
