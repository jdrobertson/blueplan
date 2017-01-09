class EventsController < ApplicationController
  def show
    @event = EventPresenter.new(Event.find(params[:id]))
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect_to :home
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to :events
  end
  
  private

  def event_params
    params.require(:event).permit!
  end
end
