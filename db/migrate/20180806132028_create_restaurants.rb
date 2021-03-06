class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :cuisine
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
