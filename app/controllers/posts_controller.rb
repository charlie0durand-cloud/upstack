class PostsController < ApplicationController
  def index
    authorize Post
    @posts = policy_scope(Post)
    @user = current_user
    # At some point this should be more complex, like a sample on the latest posts.
    if params[:query].present?
      @posts = @posts.search_by_title_and_content(params[:query])
    end
  end

  def show
    # The button appears as Unsubscribe even if I'm not the user who subscribed
    # I need to do some eager loading to reduce the amount of query to get the info of each post. I have the N+1 query problem.

    @post = Post.find(params[:id])
    @subscription = Subscription.find_by(subscribed_to_id: @post.user, user_id: current_user)
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

    @subscribers = Subscription.where(current_user == :subscribed_to_id).to_a

    authorize @post

    if @post.save
      redirect_to post_path(@post)
      UserMailer.with(post: @post, subscribers: @subscribers).new_post_email.deliver_later
    else
      render :new, status: :unprocessable_entity
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
