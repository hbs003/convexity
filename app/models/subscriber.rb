class Subscriber < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  after_create :send_welcome_email



  private
  def send_welcome_email
    SubscriberMailer.welcome(self).deliver_now
  end
end
