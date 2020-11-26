class Game < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :transactions
  has_many :users, through: :transactions
end
