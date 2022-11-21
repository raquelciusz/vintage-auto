class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.integer :km
      t.string :color
      t.string :type
      t.float :price
      t.string :location
      t.boolean :available
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
