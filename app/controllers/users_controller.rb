class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

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

  def edit
  end

  def update
    if @user.update!(user_params_edit)
      redirect_to root_path, notice: "Tu perfil ha sido actualizado con éxito."
    else
      render :edit
    end
  end


  private 

  def user_params
    params.require(:user).permit(:username, :email, :phone, :password, :password_confirmation, :role)
  end

  def set_user
    @user = current_user 
  end

  def user_params_edit
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
