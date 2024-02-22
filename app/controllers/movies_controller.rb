class MoviesController < ApplicationController
  def index
    @movies = Movie.select('movies.*, COALESCE(AVG(reviews.stars), 0) as average_rating')
                   .left_joins(:reviews)
                   .group('movies.id')
                   .order('average_rating DESC')
                   .page(params[:page]).per(10) # Pagination with 10 items per page
  end
end
