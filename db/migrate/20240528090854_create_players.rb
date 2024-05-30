class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :attack, default: 0
      t.integer :defense, default: 0

      t.timestamps
    end
  end
end
