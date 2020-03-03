class User < ApplicationRecord
    has_many :bookings 
    has_many :performances, through: :bookings

    has_secure_password
end
