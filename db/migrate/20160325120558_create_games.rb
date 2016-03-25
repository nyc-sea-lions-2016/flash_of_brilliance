class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user, index: true
      t.references :deck, index: true
      t.integer :num_correct, default: 0
      t.integer :num_incorrect, default: 0
      t.integer :first_try_count, default: 0
      t.integer :total_guesses, default: 0

      t.timestamps null: false
    end
  end
end
