class Enterprise < ApplicationRecord
  has_many :offers
  has_many :reviews, dependent: :destroy
  has_many :stocks
  has_many :users, through: :stocks
  has_many :founders
  validates :name, presence: true
  validates :abstract, presence: true
  validates :name, uniqueness: true
  mount_uploader :photo, PhotoUploader
end
