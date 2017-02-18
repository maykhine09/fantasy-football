class AddWinningRateToTeamTbl1 < ActiveRecord::Migration
  def self.up
    add_column :teams, :winning_rate, :float, :default => "0.0"
  end

  def self.down
    remove_column :teams, :winning_rate, :float, :default => "0.0"
  end
end
