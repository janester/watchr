class AddTrailerToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :trailer, :text
  end
end
