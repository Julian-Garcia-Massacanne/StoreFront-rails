class Client < ApplicationRecord
  has_many :sales, dependent: :restrict_with_error

  validates :name, :lastname, :dni, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true
  validates :dni, uniqueness: true
end