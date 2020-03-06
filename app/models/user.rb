class User < ApplicationRecord
    has_many :bookings 
    has_many :performances, through: :bookings
    has_secure_password

    validates :email, uniqueness: true
    validates :name, presence: true


    def get_user_booking
        self.bookings
    end
end
