class AddKindToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :kind, :string
  end
end
