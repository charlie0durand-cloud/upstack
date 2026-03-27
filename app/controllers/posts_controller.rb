class PostsController < ApplicationController
  def index
    @posts = Post.all
    # At some point this should be more complex, like a sample on the latest posts.
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  def new
  end

  def create
    @post = Post.new
    @post.user = current_user

    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end
end
