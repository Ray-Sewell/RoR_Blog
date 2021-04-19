class Article < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { minimum: 10, maximum: 40 }
    validates :body, presence: true, length: { minimum: 10, maximum: 500 }
end
