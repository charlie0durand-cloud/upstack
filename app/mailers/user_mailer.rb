class UserMailer < ApplicationMailer
  def new_post_email
    @post = params[:post]
    @subscribers = params[:subscribers]

    @subscribers.each do |subscriber|
      @email = User.find_by_id(subscriber.user_id).email
      mail(to: @email, subject: "New post from #{@post.user.username}")
    end

    # My create post method call new_post_email and pass @post and the array @subscribers at this moment.
    # I have a view of the email new_post_email.html.erb.
  end
end
