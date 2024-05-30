class Player < ApplicationRecord
    has_many :player_coordinates
    has_many :coordinates, through: :player_coordinates
  
    def total_stats
      base_stats = {
        attack: self.attack,
        defense: self.defense,
      }
  
      coordinates.each do |coordinate|
        base_stats[:attack] += coordinate.attack
        base_stats[:defense] += coordinate.defense
      end
  
      base_stats
    end
end
