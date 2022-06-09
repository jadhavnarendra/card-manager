class User < ApplicationRecord

  # has_many :atmcards
  # has_many :billings
  has_many :cards

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable   

end
