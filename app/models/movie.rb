class Movie < ApplicationRecord
  has_many :movies_actors
  has_many :actors, through: :movies_actors
  has_many :movies_locations
  has_many :filming_locations, through: :movies_locations
  has_many :movies_countries
  has_many :countries, through: :movies_countries
  has_many :reviews
end