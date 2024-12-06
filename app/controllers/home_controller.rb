class HomeController < ApplicationController
  def index
    @q = Product.ransack(params[:q]) # Por defecto, excluirá eliminados
    @products = @q.result.includes(:category)
  end

  def show
    @product = Product.find(params[:id])
  end
end
