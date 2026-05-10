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

  def index
    @subscriptions = policy_scope(Subscription)

    @subscriptions = Subscription.where(current_user == :user_id)
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    authorize @subscription
    @subscription.destroy
  end
end
