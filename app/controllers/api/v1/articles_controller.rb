class Api::V1::ArticlesController < Api::BaseController
  before_action :article, only: [:udpate, :destroy]

  def index
    articles = Article.all
    render json: articles, status: 200
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: {error: 'article cant be created'}, status: :not_created
    end
  end

  def update
    if article.update(article_params)
      render json: article, status: 200
    else
      render json: {error: 'article cant be updated'}
    end
  end

  def destroy
    if article.destroy
      render json: {message: 'Article deleted!!'}, status: 200
    else
      render json: {error: 'article cant be deleted'}
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def article
    @article ||= Article.find(params[:id])
  end
end
