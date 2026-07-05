class UsersController < ApplicationController
  def show
    @user = Post.find(params[:id]).user
    authorize @user
    @posts = Post.where user_id: @user.id
  end
end
