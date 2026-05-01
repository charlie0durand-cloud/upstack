class UserMailer < ApplicationMailer
  def new_post_email
    @post = params[:post]
    @subscribers = params[:subscribers]

    @subscribers.each do |subscriber|
      @email = User.find_by_id(subscriber.user_id).email
      mail(to: @email, subject: "New post from #{@post.user.username}")
    end

    # My create post method will call new_post_email. I can pass @post at this moment.
    # I should be able to reconstruct the url with the id of @post
  end
end
