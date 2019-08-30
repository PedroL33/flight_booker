class Flight < ApplicationRecord
    belongs_to :from_airport, :class_name => "Airport", :foreign_key => "start_id"
    belongs_to :to_airport, :class_name => "Airport", :foreign_key => "finnish_id"
    has_many :bookings
    has_many :passengers, through: :bookings
    scope :date, -> { distinct.order(date: :asc).select(:date) }
end
