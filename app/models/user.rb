class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, {
    employee: 0,
    manager: 1,
    admin: 2
  }

  def block!
    update(blocked: true, password: SecureRandom.hex(16))
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  validates :role, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false, message: "ya está en uso" }
  validates :email, presence: true, uniqueness: { case_sensitive: false, message: "ya está registrado" }
  validates :phone, presence:true

  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  private 

  def password_required?
    new_record? || password.present?
  end
end
