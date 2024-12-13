class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :cant, presence: true, numericality: { greater_than: 0 }
  validates :unit_price, presence: true
  validate :quantity_cannot_exceed_stock

  private

  def set_unit_price
    self.unit_price = product.unit_price if product
  end

  def quantity_cannot_exceed_stock
    if product.present? && cant > product.stock
      errors.add(:cant, "excede el stock disponible (#{product.stock})")
    end
  end
end