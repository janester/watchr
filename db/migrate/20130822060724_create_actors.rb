class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :rt_id

      t.timestamps
    end
  end
end
