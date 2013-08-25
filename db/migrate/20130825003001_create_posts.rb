class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :votes, :default => 0
      t.string :kind
      t.string :party_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
