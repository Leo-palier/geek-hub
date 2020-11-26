class Game < ApplicationRecord
	has_one_attached :photo
  belongs_to :user
  has_many :transactions
  has_many :users, through: :transactions

  include PgSearch::Model
  pg_search_scope :search_by,
    against: [ :name, :console ],
    using: {
      tsearch: { prefix: true }
    }
end
