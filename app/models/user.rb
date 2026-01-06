class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quotes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_quotes, through: :likes, source: :quote

  validates :username, presence: true, uniqueness: true
  
  def own?(object)
    id == object&.user_id
  end

  def like?(quote)
    liked_quotes.include?(quote)
  end
end
