class Post < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :subscription_emails
  has_many :comments
  has_rich_text :content
  has_one_attached :post_picture

  include PgSearch::Model

  pg_search_scope :search_by_title_and_content,
                  against: [:title],
                  associated_against: {
                    rich_text_content: [:body]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
