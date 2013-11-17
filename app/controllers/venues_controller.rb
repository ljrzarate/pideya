class VenuesController < ApplicationController
  before_filter :require_user, only: [:new, :create]

  def index
    @venues = Venue.scoped
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(params[:venue])
    p @venue
    if @venue.save
      p @venue.errors
      redirect_to venues_path
    else
      render action: :new
    end
  end

  def get_venues
    @venues = Venue.all
    p @venues
    respond_to do |format|
      format.json { render_for_api :venues, json: @venues }
    end
  end
end
