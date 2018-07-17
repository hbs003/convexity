class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates_presence_of :title, :content, :call, :date, :photo, :author


end
