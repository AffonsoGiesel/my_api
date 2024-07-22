class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
