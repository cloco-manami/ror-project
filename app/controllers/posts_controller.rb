class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post, only: %i[show update destroy]
  def index
    @posts = Post.where(author_id: @current_user.id)
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

  def update
    form = PostUpdateForm.new(params)
    return error_validation(form.errors) if form.invalid?

    @post.author_id = @current_user.id
    @post.title = form.title if form.title.present?
    @post.meta_title = form.meta_title if form.meta_title.present?
    @post.slug = form.slug if form.slug.present?
    @post.summary = form.summary if form.summary.present?
    @post.content = form.content if form.content.present?

    return error_validation(@post.errors) if @post.invalid?

    @post.save!
  end

  def destroy
    @post.destroy!
  end

  private

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { "error": 'Post not found' }, status: :not_found
  end

end
