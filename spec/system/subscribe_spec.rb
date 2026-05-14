require "rails_helper"

RSpec.describe "user clicking on Subscribe", type: :system do
  it "create a Subscription" do
    user = User.create!(email: "test@test.com", username: "Test", password: "password")
    user2 = User.create!(email: "test2@test.com", username: "Test2", password: "password2")
    post = Post.new(title: "test", content: "test", user_id: user.id)
    post.save!(validate: false)
    sign_in user2

    visit "/posts/#{post.id}"
    expect { click_button("Subscribe") }.to change { Subscription.count }.by(1)
  end
end
