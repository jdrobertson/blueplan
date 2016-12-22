class HomesController < ApplicationController
  def show
    @events = Event.all
    @songs = Song.all
  end
end
