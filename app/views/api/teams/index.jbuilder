empty = {}
json.array! @teams.each do |team|
  json.id team.id
  json.name team.name
  player1 = team.team_players.first.player1
  if player1.present?
    json.player1 do
      json.id player1.id
      json.first_name player1.first_name
      json.last_name player1.last_name
    end
  else
    json.player1 empty
  end

  player2 = team.team_players.first.player2
  if player2.present?
    json.player2 do
      json.id player2.id
      json.first_name player2.first_name
      json.last_name player2.last_name
    end
  else
    json.player2 empty
  end
end
