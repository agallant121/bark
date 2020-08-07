class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password

  has_many :reviews, dependent: :destroy
  has_many :restaurants, dependent: :destroy
end
