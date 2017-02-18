class Game < ActiveRecord::Base
  belongs_to :match

  validates_presence_of :match_id, :team1_score, :team2_score

  after_save :check_winning_team

  def check_winning_team
    match = Match.where(:id => self.match_id).first
    puts "match #{match}"
    games = match.games
    team1_winning_count = 0
    team2_winning_count = 0
    if games.count >= 2
      games.each do |game|
        team1_winning_count += 1 if game.team1_score > game.team2_score
        team2_winning_count += 1 if game.team2_score > game.team1_score
      end
    end
    match.winning_team_id = (team1_winning_count > team2_winning_count) ? match.team1_id : ((team2_winning_count > team1_winning_count) ? match.team2_id : '')
    Team.calculate_rate(match)
    match.save!
  end
end
