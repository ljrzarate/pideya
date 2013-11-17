class VenuesController < ApplicationController
  before_filter :logged_in

  def index
    @venues = Venue.scoped
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(params[:venue])
    if @venue.save
      redirect_to venues_path
    else
      render action: :new
    end
  end

  def get_venues
    @venues = Venue.scoped
    respond_to do |format|
      format.json { render_for_api :venues, json: @venues }
    end
  end
end
