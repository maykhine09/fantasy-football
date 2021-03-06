class Match < ActiveRecord::Base
  belongs_to :team1, :class_name => 'Team', foreign_key: "team1_id"
  belongs_to :team2, :class_name => 'Team', foreign_key: "team2_id"
  belongs_to :winning_team, :class_name => 'Team', foreign_key: "winning_team_id"
  has_many :games

  accepts_nested_attributes_for :games, :allow_destroy => true
end
