class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
     render json: { error: 'Ação não permitida' }, status: :forbidden
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     render json: @user, status: :created
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  def update
    render json: { error: 'Ação não permitida' }, status: :forbidden
  end

  def destroy
    render json: { error: 'Ação não permitida' }, status: :forbidden
  end

  # def user_params
  #   params.require(:user).permit(:email, :password, :password_confirmation)
  # end
end
