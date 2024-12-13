class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :sale_items, dependent: :destroy
  has_many :products, through: :sale_items

  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :sale_items, allow_destroy: true

  def active?
    state == "activa"
  end

  def cancel!
    return unless active?

    transaction do
      restore_stock
      update!(state: "cancelada")
    end
  end

  def restore_stock
    sale_items.each do |item|
      product = item.product
      product.update!(stock: product.stock + item.cant)
    end
  end
end