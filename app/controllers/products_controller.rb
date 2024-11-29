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
end
