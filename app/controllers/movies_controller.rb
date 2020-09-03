class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :destroy]

  def index
    @movies = Movie.all

    if @movies
      render json: {
        movies: @movies
      }
    else
      render json: {
        status: 500,
        errors: ['Movies not found']
      }
    end

  end

  def show
    @movie = Movie.find(params[:id])

    if @movie
      render json: {
        movie: @movie
      }
    else
      render json: {
        status: 500,
        errors: ['Movie not found']
      }
    end
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: {
        status: :created,
        movie: @movie
      }
    else
      render json: {
        status: 400,
        errors: @movie.errors.full_messages
      }
    end
  end

  def find_nominates
    @nominates = Movie.where("user_id = ?", current_user.id)

    if @nominates
      render json: {
        nominates: @nominates
      }
    else
      render json: {
        status: 500,
        errors: ['No nominates']
      }
    end
  end

  def destroy
    @movie.destroy
    render json: {
      status: 200,
      destroy: true
    }
  end

  private

  def set_movie
      @movie = Movie.find(params[:id])
    end

  def movie_params
    params.require(:movie).permit(:title, :year, :imdbId, :movie_type, :poster, :user_id)
  end

end
