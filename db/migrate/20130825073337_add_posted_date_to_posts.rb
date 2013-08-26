class AddPostedDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :posted_at, :datetime
    add_column :posts, :popularity, :integer
    add_column :posts, :likes, :integer
    add_column :posts, :comments, :integer
    add_column :posts, :shares, :integer
  end
end
