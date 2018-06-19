class Booking < ApplicationRecord
  has_many :travellers
  belongs_to :package, required: false
  belongs_to :user
  belongs_to :type, required: false
end