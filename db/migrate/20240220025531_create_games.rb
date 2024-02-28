class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :url
      t.date :date_played
      t.string :time_control
      t.string :color
      t.string :outcome
      t.boolean :time_management
      t.boolean :tactic
      t.boolean :opening_position
      t.boolean :middlegame_position
      t.boolean :endgame_position
      t.boolean :blunder
      t.boolean :give_up
      t.string :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
