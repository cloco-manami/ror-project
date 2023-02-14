class AddColumnToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :content, :text
    add_column :articles, :order, :integer, default: 0
    add_column :articles, :status, :integer
    add_column :articles, :memo, :text
  end
end
