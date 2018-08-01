class Offer < ApplicationRecord
  belongs_to :enterprise
  validates :pu, presence: true
  validates :description, presence: true
  validates :share, presence: true
  validates :units, presence: true
end
