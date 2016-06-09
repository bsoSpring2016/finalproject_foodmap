class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :map_description
      t.integer :user_id
      t.string :map_image
      t.string :map_name

      t.timestamps

    end
  end
end
