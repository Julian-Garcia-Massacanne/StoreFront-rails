class Product < ApplicationRecord
    validates :name, presence: true
    validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }

    has_many_attached :images

    # Para el borrado lógico
    default_scope { where(deleted_at: nil) }

    # Método para borrado lógico
    def soft_delete
      update(deleted_at: Time.current, stock: 0)
    end

    # Scope para búsquedas
    scope :search, ->(query) {
      where("name ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
    }
end
