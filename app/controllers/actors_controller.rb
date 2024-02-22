class ActorsController < ApplicationController
  def index
    # This will display all actors by default
    @actors = Actor.all
  end

  def search
    if params[:search].present?
      @actors = Actor.where('name LIKE ?', "%#{params[:search]}%")
    else
      @actors = Actor.all
    end
    render :index
  end
end
