class ProductsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @products = Product.all

    # Filtros opcionales
    @products = @products.where(category: params[:category]) if params[:category].present?
    @products = @products.search(params[:query]) if params[:query].present?
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Producto creado exitosamente"
    else
      render :new
    end
  end


  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :unit_price,
      :stock,
      :category,
      :size,
      :color,
      images: []
    )
  end
end
