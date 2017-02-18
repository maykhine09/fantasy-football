class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :winning_team_id, :default => ""

      t.timestamps null: false
    end
  end
end
