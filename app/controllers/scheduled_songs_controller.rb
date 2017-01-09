class ScheduledSongsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    event.scheduled_songs.create(params.require(:scheduled_song).permit(:song_id))
    redirect_to :back
  end
end
