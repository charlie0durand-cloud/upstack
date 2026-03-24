class Subscription < ApplicationRecord
  belongs_to :user
  has_many :subscription_emails
end
