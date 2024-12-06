class Product < ApplicationRecord
    belongs_to :category
    validates :name, :category, presence: true
    validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }

    has_many_attached :images

    # Para el borrado lógico
    default_scope { where(deleted_at: nil) }

    #Para obtener los borrados
    scope :with_deleted, -> { unscope(where: :deleted_at) }

    # Método para borrado lógico
    def soft_delete
      update(deleted_at: Time.current, stock: 0)
    end

    #Para el filtrado, definis sobre que atributos se puede buscar o que relaciones
    def self.ransackable_attributes(auth_object = nil)
      %w[name category_id]
    end
  
    # Si necesitas filtrar por relaciones
    def self.ransackable_associations(auth_object = nil)
      %w[category]
    end
end
