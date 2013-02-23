class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :vin
      t.string :make
      t.string :model
      t.integer :year
      t.integer :value
      t.string :vid
      t.string :trim

      t.timestamps
    end
  end
end
