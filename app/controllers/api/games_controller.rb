class Api::GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @match = Match.where(:id => params[:id]).first
    return render json: { message: 'Invalid Match!'}, status: 400 if @match.blank?

    @game = Game.new(:match_id => params[:id],
                      :team1_score => params[:team1_score],
                      :team2_score => params[:team2_score])

    unless @game.save!
      return render json: { message: @game.errors}, status: 400
    end
  end

  def update
    @game = Game.where(:id => params[:id]).first
    return render json: { message: 'Invalid Game!'},status: 400 if @game.blank?

    unless @game.update(update_params)
      return render json: { message: @game.errors }, status: 400
    end
  end

  private
  def update_params
    params.permit(:team1_score, :team2_score)
  end
end
