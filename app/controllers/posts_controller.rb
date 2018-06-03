class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = policy_scope(Post)
  end

  def show
  end

  def new
    @post = current_user.posts.new
    authorize @post
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    authorize @post

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    @post.update(post_params)

    if @post.save
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :location, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end
end
