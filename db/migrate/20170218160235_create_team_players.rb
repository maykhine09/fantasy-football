class CreateTeamPlayers < ActiveRecord::Migration
  def change
    create_table :team_players do |t|
      t.integer :team_id
      t.integer :player1_id
      t.integer :player2_id

      t.timestamps null: false
    end
  end
end
