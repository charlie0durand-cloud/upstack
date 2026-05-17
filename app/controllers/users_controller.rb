class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @posts = Post.where user_id: @user.id
  end
end
