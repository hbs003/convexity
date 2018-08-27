class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :stocks
  has_many :enterprises, through: :stocks
  has_many :reviews, dependent: :destroy
  has_many :investments
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :cpf, uniqueness: true
  after_create :subscribe_to_newsletter
  mount_uploader :photo, PhotoUploader




  private

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end







  # def configure_permitted_parameters
  #   # For additional fields in app/views/devise/registrations/new.html.erb
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
  # end

end
