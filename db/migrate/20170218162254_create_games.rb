class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :match_id
      t.integer :team1_score
      t.integer :team2_score

      t.timestamps null: false
    end
  end
end
