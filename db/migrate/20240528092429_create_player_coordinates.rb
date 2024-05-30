class CreatePlayerCoordinates < ActiveRecord::Migration[6.1]
  def change
    create_table :player_coordinates do |t|
      t.references :player, null: false, foreign_key: true
      t.references :coordinate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
