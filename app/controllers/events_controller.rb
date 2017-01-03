class EventsController < ApplicationController
  def show
    @event = EventPresenter.new(Event.find(params[:id]))
  end

  def destroy
    @event = Event.find(params[:id])
  end
end
