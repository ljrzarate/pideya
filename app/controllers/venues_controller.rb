class VenuesController < ApplicationController
  def index
    @venues = Venue.scoped
  end

  def get_venues
    @venues = Venue.scoped
    respond_to do |format|
      format.json { render_for_api :venues, json: @venues }
    end
  end
end
