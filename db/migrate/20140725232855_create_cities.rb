class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :land_id
      t.integer :resources_id
      t.string :name

      t.timestamps
    end
  end
end
