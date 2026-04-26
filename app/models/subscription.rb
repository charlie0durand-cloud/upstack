class Subscription < ApplicationRecord
  belongs_to :user
  has_many :subscription_emails
  # I need to make a validates here to make sure we can subscribe only once
end
