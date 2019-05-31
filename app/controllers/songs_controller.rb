# only index and show routes for :songs
class SongsController < ApplicationController
  before_action :authenticate_user
  before_action :set_song, only: [:show ]

  # GET /songs
  def index
    @songs = Song.all

    render json: @songs.to_json(include: :playlists)
  end

  # GET /songs/1
  def show
    render json: @song.to_json(include: :playlists)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

end
