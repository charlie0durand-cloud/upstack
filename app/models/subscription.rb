class Subscription < ApplicationRecord
  belongs_to :user
  has_many :subscription_emails
  validates :subscribed_to_id, comparison: { other_than: :user_id, message: "You can't subscribe to yourself." }
  validates :subscribed_to_id, uniqueness: { scope: :user_id, message: "You can't subscribe twice to the same user."}
end
