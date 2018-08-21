class Offer < ApplicationRecord
  belongs_to :enterprise
  has_many :investments
  validates :pu, presence: true
  validates :description, presence: true
  validates :share, presence: true
  validates :units, presence: true
end
