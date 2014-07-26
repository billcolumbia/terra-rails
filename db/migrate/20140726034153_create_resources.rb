class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :cash, default: 0
      t.integer :materials, default: 0
      t.integer :food, default: 0

      t.timestamps
    end
  end
end
