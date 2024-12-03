class ProductsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      redirect_to products_path, notice: "Producto creado exitosamente"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
    @categories = Category.all()
  end

  def update
    @product = Product.find(params[:id])
    authorize @product
    if @product.update(product_params)
      redirect_to @product, notice: "Producto actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to products_path, notice: "Se elimino el producto Correctamente"
  end


  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :unit_price,
      :stock,
      :size,
      :category_id,
      :color,
      images: []
    )
  end
end
