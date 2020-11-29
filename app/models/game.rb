class Game < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :transactions
  has_many :users, through: :transactions
  validates :name, presence: true
  validates :console, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :photo, presence: true


  include PgSearch::Model
  pg_search_scope :search_by,
                  against: %i[name console],
                  using: {
                    tsearch: { prefix: true }
                  }
end
