class AddIndexToSlugColumnOfPosts < ActiveRecord::Migration[7.0]
  def change
    add_index :posts, :slug, unique: true
  end
end
