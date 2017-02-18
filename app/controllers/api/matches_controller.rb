class Api::MatchesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @match = Match.new(:team1_id => params[:team1_id],
                      :team2_id => params[:team2_id])
    unless @match.save!
      return render json: { message: @match.errors }, status: 400
    end
  end

  def show
    @match = Match.where(:id => params[:id]).first
    return render json: { message: 'Invalid Match!'}, status: 400 if @match.blank?
  end
end
