class Api::TeamsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # def index
  #   @teams = Team.all.order("winning_rate DESC")
  # end

  def create
    team = Team.where(:name => params[:name]).first
    return render json: { message: "Team with the name already exist!"},status: 400 if team.present?

    @team = Team.new(:name => params[:name])
    if @team.save!
      @team_players = TeamPlayer.create(:team_id => @team.id,
                        :player1_id => params[:player1_id],
                        :player2_id => params[:player2_id])
    else
      return render json: { message: @team.errors }, status: 400
    end
  end

  def update
    @team = Team.where(:id => params[:id]).first
    return render json: { message: "Invalid Team!"},status: 400 if @team.blank?

    @team_players = @team.team_players.first
    if @team_players.present?
      @team_players.update_attributes(:player1_id => params[:player1_id],
                                :player2_id => params[:player2_id])
    else
      TeamPlayer.create(:team_id => @team.id,
                        :player1_id => params[:player1_id],
                        :player2_id => params[:player2_id])
    end
  end
end
