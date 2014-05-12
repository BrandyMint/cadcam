class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.float  :latitude,  null: false
      t.float  :longitude, null: false
      t.string :image,     null: false
      t.text   :comment
      t.string :device_id, null: false
      t.string :state

      t.timestamps
    end

    add_index :photos, :device_id
  end
end
