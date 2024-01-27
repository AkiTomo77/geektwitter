class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :body
      t.integer :user_id
      t.string :image
      t.string :audio
      t.string :video

      t.timestamps
    end
  end
end
