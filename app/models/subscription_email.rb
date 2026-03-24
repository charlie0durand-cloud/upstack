class SubscriptionEmail < ApplicationRecord
  belongs_to :post
  belongs_to :subscription
end
