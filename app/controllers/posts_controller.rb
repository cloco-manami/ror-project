class PostsController < ApplicationController
  before_action :authenticate_user
  def index
    @posts = Post.all
    # where(author_id: @current_user.id)
  end

  def create
    form = PostCreateForm.new(params)
    return error_validation(form.errors) if form.invalid?

    @post = Post.new
    @post.author_id = @current_user.id
    @post.title = params[:title]
    @post.meta_title = params[:meta_title]
    @post.slug = params[:slug]
    @post.summary = params[:summary]
    @post.content = params[:content]

    return error_validation(@post.errors) if @post.invalid?

    @post.save!
  end

  def show; end

  def update; end

  def destroy; end
end
