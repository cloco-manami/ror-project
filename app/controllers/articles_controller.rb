class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: { status: 'SUCCESS', message: 'Loaded articles', data: @articles }

  end

  def create
  end

  def show
  end

  def update
  end
end
