class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tools, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :booked_tools, through: :bookings, source: :tool
  has_one_attached :avatar

end
