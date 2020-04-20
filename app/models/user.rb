class User < ApplicationRecord
    has_many :bookings 
    has_many :performances, through: :bookings
    has_secure_password

    validates :email, uniqueness: true
    validates :name, presence: true


    def get_user_booking
        self.bookings
    end

    def get_future_show
        get_user_booking.select{|book| Performance.find_by(id: book[:performance_id])[:date_time] > DateTime.now}
    end

    def get_previous_show
        get_user_booking.select{|book| Performance.find_by(id: book[:performance_id])[:date_time] < DateTime.now}
    end
end
