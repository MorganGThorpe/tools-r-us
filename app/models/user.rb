class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tools, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :booked_tools, through: :bookings, source: :tool
  has_many :reviews, dependent: :destroy
  has_one_attached :avatar

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, :first_name, :last_name, :address, presence: true
end


