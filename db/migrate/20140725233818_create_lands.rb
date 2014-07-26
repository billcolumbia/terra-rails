class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
      t.integer :size

      t.integer :homes, default: 0
      t.integer :agriculture, default: 0
      t.integer :mines, default: 0
      t.integer :industry, default: 0

      t.timestamps
    end
  end
end
