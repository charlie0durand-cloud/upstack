class Post < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :subscription_emails
  has_many :comments
end
