class User < ActiveRecord::Base
  has_many :team_players
  has_many :teams, through: :team_players

  validates_presence_of :first_name, :last_name
end
