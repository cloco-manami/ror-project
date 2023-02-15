class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    unless @article.save
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    unless @article.update(article_params)
      render json:@article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { "error": "Article not found" }, status: :not_found
  end

  def article_params
    params.require(:article).permit(:title, :content, :status, :order, :memo)
  end
end
