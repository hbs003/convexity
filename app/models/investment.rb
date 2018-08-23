class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :amount, presence: true
  validates :status, inclusion: { in: ["rejeitado", "pendente", "aprovado", "investido"] }
  mount_uploader :photo, PhotoUploader




end
