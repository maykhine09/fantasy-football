empty = {}
json.id @match.id
if @match.team1.present?
  json.team1 do
    json.id @match.team1.id
    json.name @match.team1.name
  end
else
  json.team1 empty
end

if @match.team2.present?
  json.team2 do
    json.id @match.team2.id
    json.name @match.team2.name
  end
else
  json.team2 empty
end

if @match.winning_team.present?
  json.winning_team do
    json.id @match.winning_team.id
    json.name @match.winning_team.name
  end
else
  json.winning_team "draw"
end

json.games do
  json.array! @match.games.each do |game|
    json.id game.id
    json.team1_score game.team1_score
    json.team2_score game.team2_score
  end
end
