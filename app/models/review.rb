class Review < ApplicationRecord
  belongs_to :user
  belongs_to :enterprise
  validates :content, presence: true
  validates :title, presence: true
end
