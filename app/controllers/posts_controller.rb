class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post)
    # At some point this should be more complex, like a sample on the latest posts.
    if params[:query].present?
      @posts = Post.search_by_title_and_content(params[:query])
    end

  end

  def show
    @post = Post.find(params[:id])
    @subscription = Subscription.find_by(@post.user == :subscribed_to_id && @current_user == :user_id)
    authorize @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, status: :see_other
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post

    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
    authorize @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :post_picture)
  end
end
