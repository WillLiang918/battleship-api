class CreateCells < ActiveRecord::Migration[5.0]
  def change
    create_table :cells do |t|
      t.integer :position_x, null: false
      t.integer :position_y, null: false
      t.boolean :checked, default: false
      t.boolean :available, default: true

      t.references :board
      t.timestamps
    end
  end
end
