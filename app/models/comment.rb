class Comment < ApplicationRecord
  include Visible
  belongs_to :article

  validates :author, presence: true
  validates :body, presence: true, length: { minimum: 1 }
end
