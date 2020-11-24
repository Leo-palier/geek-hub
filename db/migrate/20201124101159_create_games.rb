class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :console
      t.integer :year
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
