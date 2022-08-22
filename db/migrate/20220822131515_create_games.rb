class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :price_per_day
      t.boolean :disponibility
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
