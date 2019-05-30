class LedgersController < ApplicationController
  before_action :set_ledger, only: [:show, :update, :destroy]

  # GET /ledgers - route to get the id of a ledger by ids of a playlist and a song
  def index
    # localhost:3000/ledgers?playlist_id=1&song_id=1
    puts "ledgers params=#{params}"
    @ledgers = Ledger.all

    ledger = Ledger.where("playlist_id = #{params[:playlist_id]} AND song_id = #{params[:song_id]}")[0].id;

    puts "ledgerfound=#{ledger}"

    render json: { ledger_id: ledger }
    # render json: @ledgers.to_json(include: [:song, :playlist])
  end

  # GET /ledgers/1
  def show
    render json: @ledger.to_json(include: [:song, :playlist])
  end

  # POST /ledgers
  def create
    @ledger = Ledger.new(ledger_params)

    if @ledger.save
      render json: @ledger, status: :created, location: @ledger
    else
      render json: @ledger.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ledgers/1
  def update
    if @ledger.update(ledger_params)
      render json: @ledger
    else
      render json: @ledger.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ledgers/1
  def destroy
    puts "ledger params=#{params}"
    @ledger.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ledger
      @ledger = Ledger.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ledger_params
      params.require(:ledger).permit(:song_id, :playlist_id, :plays)
    end
end
