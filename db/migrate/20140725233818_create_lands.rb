class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
      t.integer :size

      t.integer :homes
      t.integer :agriculture
      t.integer :mines
      t.integer :industry
      t.integer :barren

      t.timestamps
    end
  end
end
