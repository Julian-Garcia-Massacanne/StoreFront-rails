class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    @user.entry_date = Date.today
    if @user.save
      redirect_to users_path, notice: "Usuario creado exitosamente"
    else
      render :new
    end
  end

  def block
    @user = User.find(params[:id])
    if @user.block!
      redirect_to users_path, notice: "Usuario Bloqueado exitosamente"
    else
      redirect_to users_path, notice: "El usuario ya se encuentra bloqueado"
    end
  end


  private 

  def user_params
    params.require(:user).permit(:username, :email, :phone, :password, :password_confirmation, :role)
  end

end
