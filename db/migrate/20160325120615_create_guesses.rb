class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :card, index: true
      t.references :game, index: true
      t.integer :guess_count, default: 0

      t.timestamps null: false
    end
  end
end
