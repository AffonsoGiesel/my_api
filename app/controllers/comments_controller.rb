class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def create
      @comment = current_user.comments.build(comment_params)
      if @comment.save
        render json: @comment, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
  end
  
  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    head :no_content
  end

  private
  
  def comment_params
    params.require(:comment).permit(:name, :comment, :post_id)
  end
end
  