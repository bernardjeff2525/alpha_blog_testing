class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable ,authentication_keys: [:username]

  has_many :articles, dependent: :destroy
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

end