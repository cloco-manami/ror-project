class PostsController < ApplicationController
  def index
    @posts = Post.all
    # where(author_id: @current_user.id)
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :meta_title, :slug, :summary, :content,
                                                  :author_name_katakana, :published, :published_date))
    @post.author_id = @current_user.id
    @post.save!
  end

  def show; end

  def update; end

  def destroy; end
end
