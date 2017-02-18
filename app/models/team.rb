class Team < ActiveRecord::Base
  has_many :team_players
  has_many :users, through: :team_players
  has_many :winning_matches, class_name: "Match", foreign_key: "winning_team_id"
  has_many :matches

  validates_presence_of :name

  def self.calculate_rate(match)
    team1 = match.team1
    team1_matches = Match.where("team1_id = ? OR team2_id = ?", team1.id, team1.id)
    team1_winning_rate = team1.winning_matches.count.to_f / team1_matches.count.to_f * 100.0
    team1.update_attributes(:winning_rate => team1_winning_rate)

    team2 = match.team2
    team2_matches = Match.where("team1_id = ? OR team2_id = ?", team2.id, team2.id)
    team2_winning_rate = team2.winning_matches.count.to_f / team2_matches.count.to_f * 100.0
    team2.update_attributes(:winning_rate => team2_winning_rate)
  end
end
