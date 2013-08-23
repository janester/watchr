class AddFbToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :fb_id, :string
    add_column :movies, :cover, :text
    add_column :movies, :likes, :string
    add_column :movies, :website, :text
    add_column :movies, :talking_about, :string
  end
end
