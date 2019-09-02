class Passenger < ApplicationRecord
    has_many :bookings
    has_many :flights, through: :bookings

    validates :email, presence: true
    validates :name, presence: true
end
