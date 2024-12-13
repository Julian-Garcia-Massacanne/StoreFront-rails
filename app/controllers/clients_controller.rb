class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to new_sale_path, notice: "Cliente creado exitosamente."
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :lastname, :dni, :phone)
  end
end
