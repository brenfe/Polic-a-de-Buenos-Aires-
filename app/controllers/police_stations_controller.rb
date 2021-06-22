class PoliceStationsController < ApplicationController
  before_action :set_police_station, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /police_stations or /police_stations.json
  def index
    @police_stations = PoliceStation.all
    @police_stations = @police_stations.where(["name LIKE :filter", :filter => "%" + params[:filter] + "%"]) unless params[:filter].blank?
    @police_stations = @police_stations.page(params[:page]) || 1
  end

  # GET /police_stations/1 or /police_stations/1.json
  def show
  end

  # GET /police_stations/new
  def new
    @police_station = PoliceStation.new
  end

  # GET /police_stations/1/edit
  def edit
  end

  # POST /police_stations or /police_stations.json
  def create
    @police_station = PoliceStation.new(police_station_params)

    respond_to do |format|
      if @police_station.save
        format.html { redirect_to @police_station, notice: "Comisaría creada con éxito." }
        format.json { render :show, status: :created, location: @police_station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @police_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /police_stations/1 or /police_stations/1.json
  def update
    respond_to do |format|
      if @police_station.update(police_station_params)
        format.html { redirect_to @police_station, notice: "Comisaría actualizada con éxito" }
        format.json { render :show, status: :ok, location: @police_station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @police_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /police_stations/1 or /police_stations/1.json
  def destroy
    @police_station.destroy
    respond_to do |format|
      format.html { redirect_to police_stations_url, notice: "Comisaría eliminada con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_police_station
      @police_station = PoliceStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def police_station_params
      params.require(:police_station).permit(:address_id, :name)
    end
end
