class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :update, :destroy]

  # GET /playlists
  def index
    @playlists = Playlist.all

    render json: @playlists.to_json(include: :songs)
  end

  # GET /playlists/1
  def show
    # playlist = Playlist.find(params[:id])

    # render json: { status: 200, playlist: @playlist.to_json(include: :songs) }
    # puts "hello"

    # render json: @playlist

    puts "params=#{params[:id]}"
    ledger = Ledger.where("playlist_id = #{params[:id]} AND song_id = 1");
    # playlist_this = { playlist: @playlist }.to_json
    # puts "playlist_this=#{playlist_this}"

    puts "ledger=#{ledger[0].id}"
    render json: @playlist.to_json(include: :songs)
  end

  # POST /playlists
  def create
    puts "params=#{params}"
    @playlist = Playlist.new(playlist_params)

    if @playlist.save
      render json: @playlist, status: :created
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /playlists/1
  def update
    if @playlist.update(playlist_params)
      render json: @playlist.to_json(include: :songs)
    else
      render json: @playlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /playlists/1
  def destroy
    @destroyed = @playlist.destroy
    render json: { status: 204, playlist: @destroyed }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def playlist_params
      params.require(:playlist).permit(:title, :user_id)
    end
end
