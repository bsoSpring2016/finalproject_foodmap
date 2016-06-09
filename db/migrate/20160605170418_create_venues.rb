class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :link_d
      t.string :link_c
      t.string :link_b
      t.string :link_a
      t.integer :map_id
      t.float :long
      t.float :lat
      t.string :venue_photo
      t.string :venue_address
      t.text :venue_description
      t.string :venue_name

      t.timestamps

    end
  end
end
