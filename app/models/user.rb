class User < ApplicationRecord
  has_many :books
  #has_many :orders
  #has_many :reviews

  validates :email, presence: true, uniqueness: true, length: { maximum: 60 }
  # validates :password, presence: true, length: { maximum: 20 } #LW: je désactive car Devise s'en occupe déjà et cela peut donc créer un conflit avec Devise
  validates :address, allow_nil: true, length: { maximum: 255 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
