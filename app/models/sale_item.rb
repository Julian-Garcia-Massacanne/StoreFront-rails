class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :cant, presence: true, numericality: { greater_than: 0 }
  validates :unit_price, presence: true


  private

  def set_unit_price
    self.unit_price = product.unit_price if product
  end
end