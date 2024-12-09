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

  validates :role, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false, message: "ya está en uso" }
  validates :email, presence: true, uniqueness: { case_sensitive: false, message: "ya está registrado" }
  validates :phone, presence:true
end
