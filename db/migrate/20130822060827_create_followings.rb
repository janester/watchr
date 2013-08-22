class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :user_id
      t.integer :movie_id
      t.boolean :is_watched, :default => false

      t.timestamps
    end
  end
end
