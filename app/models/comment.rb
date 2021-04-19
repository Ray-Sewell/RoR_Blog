class Comment < ApplicationRecord
  include Visible
  belongs_to :article

  validates :author, presence: true, length: { minimum: 1, maximum: 15 }
  validates :body, presence: true, length: { minimum: 10, maximum: 60 }
end
