class Booking < ApplicationRecord
    belongs_to :user 
    belongs_to :performance
    validates :num_of_tickets,  numericality: { only_integer: true, greater_than: 0}

    def get_price(seat_type, performance, seats)
        case seat_type
        when "stalls"
            self.total_price = performance[:min_price] * seats
        when "lower"
            self[:total_price] = performance[:min_price] * seats * 2
        when "upper"
            self[:total_price] = performance[:min_price] * seats * 3
        end
        self.save
    end

    def check_tickets
        performance = Performance.find_by(id: self[:performance_id])
        performance["#{self[:seating_type]}_available"] >= self[:num_of_tickets]
    end
end
