class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.string :emoji
      t.references :tweet, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
