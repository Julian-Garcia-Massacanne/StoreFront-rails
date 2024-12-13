class SalesController < ApplicationController

  def index
    @sales = Sale.includes(:client, :user)
  end

    def new
      @sale = Sale.new
      @sale.sale_items.build
      @clients = Client.all
      @products = Product.all
    end
  
    def create
      @sale = Sale.new(sale_params)
      @sale.date = Time.current
      @sale.user = current_user
      @sale.state = "activa"
  
      # Reemplazar precios unitarios con los del producto
      @sale.sale_items.each do |item|
        product = Product.find(item.product_id)
        item.unit_price = product.unit_price
        item.subtotal = item.cant.to_i * product.unit_price
      end
  
      @sale.total = calculate_total(@sale)
  
      ActiveRecord::Base.transaction do
        if @sale.save
          @sale.sale_items.each do |item|
            product = Product.find(item.product_id)
            raise ActiveRecord::Rollback if product.stock < item.cant
  
            product.update!(stock: product.stock - item.cant)
          end
          redirect_to sales_path, notice: "Venta registrada exitosamente."
        else
          @clients = Client.all
          @products = Product.all
          render :new, alert: "Error al registrar la venta. Verifica los datos."
        end
      end
    end


    def cancel
      @sale = Sale.find(params[:id])

      if @sale.active?
        @sale.cancel!
        redirect_to sales_path, notice: "La venta fue cancelada exitosamente y el stock ha sido restaurado."
      else
        redirect_to sales_path, alert: "La venta ya estaba cancelada."
      end
    end
  
    private
  
    def sale_params
      params.require(:sale).permit(
        :client_id,
        sale_items_attributes: [:product_id, :cant, :unit_price, :subtotal, :_destroy]
      )
    end
  
    def calculate_total(sale)
      sale.sale_items.sum { |item| item.subtotal.to_f }
    end
  
end
  



