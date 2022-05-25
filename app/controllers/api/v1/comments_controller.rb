class Api::V1::CommentsController < Api::BaseController
  before_action :article
  before_action :comment, only: [:show, :update, :delete]

  def show
    render json: comment, status: 200
  end

  def create
    comment = article.comments.build(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: {message: 'comment cant be created'}
    end
  end

  def update
    if comment.update(comment_params)
      render json: comment, status: 200
    else
      render json: {message: 'comment cant be updated'}
    end
  end

  def destroy
    if comment.destroy
      render json: {message: 'comment deleted'}, status: 200
    else
      render json: {message: 'comment cant be deleted'}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def article
    @article ||= Article.find(params[:article_id])
  end

  def comment
    @comment ||= article.comments.find(params[:id])
  end
end
