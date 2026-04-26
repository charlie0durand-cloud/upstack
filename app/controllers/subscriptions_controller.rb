class SubscriptionsController < ApplicationController
  def create
    @post = Post.find(params[:post])
    @subscription = Subscription.new(
      subscribed_to_id: @post.user.id,
      user_id: current_user.id
    )
    @subscription.save
    authorize @subscription
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    authorize @subscription
  end
end
