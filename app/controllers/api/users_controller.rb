class Api::UsersController < ApplicationController
skip_before_filter :verify_authenticity_token

  def index
    @users = User.all.order("first_name ASC")
  end

  def show
    @user = User.where(:id => params[:id]).first
    return render json: { message: "Invalid User!"}, status: 400 if @user.blank?
  end

  def create
    user = User.where(:first_name => params[:first_name], :last_name => params[:last_name]).first
    return render json: { message: "User already exist!"}, status: 400 if user.present?

    @user = User.new( :first_name => params[:first_name],
                      :last_name => params[:last_name])

    unless @user.save!
      return render json: { message: @user.errors}, status: 400
    end
  end

  def update
    @user = User.where(:id => params[:id]).first
    return render json: { message: "Invalid User!"}, status: 400 if @user.blank?

    unless @user.update(update_params)
      return render json: { message: @user.errors}, status: 400
    end
  end

  def destroy
    @user = User.where(:id => params[:id]).first
    return render json: { message: "Invalid User!"}, status: 400 if @user.blank?

    if @user.destroy
      return render json: { message: "User has been deleted!"}, status: 200
    else
      return render json: { message: @user.errors },status: 400
    end
  end

  private
  def update_params
    params.permit(:first_name, :last_name)
  end
end
