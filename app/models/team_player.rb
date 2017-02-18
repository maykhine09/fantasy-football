class TeamPlayer < ActiveRecord::Base
  belongs_to :team
  belongs_to :player1, :class_name => 'User'
  belongs_to :player2, :class_name => 'User'
end
