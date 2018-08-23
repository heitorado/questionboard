class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :questions

    validates :name, :login, :email, :password, :assistance_year, presence: true

    validates :name, length: { minimum: 5, maximum: 100 }

    validates :login, length: { minimum: 3, maximum: 10 }
    validates :login, uniqueness: true

    validates :email, uniqueness: true

    validates :assistance_year, numericality: { only_integer: true }
end
