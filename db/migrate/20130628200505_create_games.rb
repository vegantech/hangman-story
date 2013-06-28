class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :moves
      t.references :hangman, index: true

      t.timestamps
    end
  end
end
