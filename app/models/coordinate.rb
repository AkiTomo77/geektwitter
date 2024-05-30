class Coordinate < ApplicationRecord
    has_many :player_coordinates
    has_many :players, through: :player_coordinates
end
