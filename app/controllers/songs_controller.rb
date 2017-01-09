class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    redirect_to :home
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :path)
  end
end
