class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :initials
      t.datetime :start_time
      t.float :win_time

      t.timestamps
    end
  end
end
