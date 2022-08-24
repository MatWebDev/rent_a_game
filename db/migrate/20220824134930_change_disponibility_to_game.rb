class ChangeDisponibilityToGame < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :disponibility
    add_column :games, :disponibility, :boolean, default: true
  end
end
