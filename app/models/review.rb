class Review < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: %w(0 1 2 3 4 5) }
end
