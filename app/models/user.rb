# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  first_name             :string
#  last_name              :string
#  role                   :integer          not null
#  discarded_at           :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :role, presence: true
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :first_name, presence: { message: "Debes ingresar el nombre" }
  validates :last_name, presence: { message: "Debes ingresar el apellido" }
  validates :email, presence: { message: "Debes ingresar el email" }
  validates :email, uniqueness: { message: "Correo ya existe, verifique" }
  validates :password, presence: { message: "Ingresar Contrasena" }

  enum role: [:admin, :mesero, :chef]

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
