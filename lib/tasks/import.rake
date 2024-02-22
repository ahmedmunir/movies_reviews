require 'csv'

namespace :import do
  desc "Import movies and reviews from CSV files"
  task movies_and_reviews: :environment do
    # Import Movies and related data from movies.csv
    CSV.foreach(Rails.root.join('lib/seeds/movies.csv'), headers: true) do |row|
      movie = Movie.find_or_create_by!(title: row['Movie'], year: row['Year'], director: row['Director'], description: row['Description'])
      actor = Actor.find_or_create_by!(name: row['Actor'])
      filming_location = FilmingLocation.find_or_create_by!(location: row['Filming location'])
      country = Country.find_or_create_by!(country: row['Country'])

      MoviesActor.find_or_create_by!(movie: movie, actor: actor)
      MoviesLocation.find_or_create_by!(movie: movie, filming_location: filming_location)
      MoviesCountry.find_or_create_by!(movie: movie, country: country)
    end

    # Import Reviews from reviews.csv
    CSV.foreach(Rails.root.join('lib/seeds/reviews.csv'), headers: true) do |row|
      movie = Movie.find_by(title: row['Movie'])
      if movie
        Review.create!(movie: movie, user: row['User'], stars: row['Stars'], review: row['Review'])
      else
        puts "Movie not found for review: #{row['Movie']}"
      end
    end
  end
end
