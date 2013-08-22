class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.integer :runtime
      t.string :poster
      t.text :synopsis
      t.integer :a_score, :default => 0
      t.integer :c_score, :default => 0
      t.string :o_poster
      t.string :t_poster
      t.string :d_poster
      t.string :p_poster
      t.string :similar
      t.string :url
      t.integer :rt_id
      t.integer :imdb_id
      t.date :theater_release
      t.date :dvd_release
      t.timestamps
    end
  end
end
