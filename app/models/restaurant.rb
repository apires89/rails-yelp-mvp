class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # dependent destroy faz com que as reviews vao co crl qnd o restaurant for
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"], allow_nil: false }
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
