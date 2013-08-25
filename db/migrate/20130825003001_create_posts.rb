class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :votes
      t.string :kind
      t.string :party_id

      t.timestamps
    end
  end
end
