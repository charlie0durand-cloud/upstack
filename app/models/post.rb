class Post < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :subscription_emails
  has_many :comments
  has_rich_text :content
  has_one_attached :post_picture
end
