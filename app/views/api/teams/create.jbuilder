empty = {}
json.id @team.id
json.name @team.name

if @team_players.player1.present?
  json.player1 do
    json.id @team_players.player1_id
    json.first_name @team_players.player1.first_name.present? ? @team_players.player1.first_name : ''
    json.last_name @team_players.player1.last_name.present? ? @team_players.player1.last_name : ''
  end
else
  json.player1 empty
end

if @team_players.player2.present?
  json.player2 do
    json.id @team_players.player2_id
    json.first_name @team_players.player2.first_name.present? ? @team_players.player2.first_name : ''
    json.last_name @team_players.player2.last_name.present? ? @team_players.player2.last_name : ''
  end
else
  json.player2 empty
end

