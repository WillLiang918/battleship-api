class CreateShips < ActiveRecord::Migration[5.0]
  def change
    create_table :ships do |t|
      t.boolean :sunk, default: false
      t.boolean :computer_ship, default: false

      t.references :cell

      t.timestamps
    end
  end
end
