class RemoveDescriptionFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :description, :text
  end
end
