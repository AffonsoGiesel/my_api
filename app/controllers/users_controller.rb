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

  def update
    render json: { error: 'Ação não permitida' }, status: :forbidden
  end

  def destroy
    render json: { error: 'Ação não permitida' }, status: :forbidden
  end
end
