class PolicemenController < ApplicationController
  before_action :set_policeman, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /policemen or /policemen.json
  def index
    @policemen = Policeman.all
    @policemen = @policemen.page(params[:page]) || 1
  end

  # GET /policemen/1 or /policemen/1.json
  def show
  end

  # GET /policemen/new
  def new
    @policeman = Policeman.new
  end

  # GET /policemen/1/edit
  def edit
  end

  # POST /policemen or /policemen.json
  def create
    @policeman = Policeman.new(policeman_params)

    respond_to do |format|
      if @policeman.save
        format.html { redirect_to @policeman, notice: "Policía creado con éxito." }
        format.json { render :show, status: :created, location: @policeman }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @policeman.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policemen/1 or /policemen/1.json
  def update
    respond_to do |format|
      if @policeman.update(policeman_params)
        format.html { redirect_to @policeman, notice: "Policía actualizado con éxito." }
        format.json { render :show, status: :ok, location: @policeman }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @policeman.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policemen/1 or /policemen/1.json
  def destroy
    @policeman.destroy
    respond_to do |format|
      format.html { redirect_to policemen_url, notice: "Policía eliminado con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policeman
      @policeman = Policeman.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def policeman_params
      params.require(:policeman).permit(:person_id, :police_station_id)
    end
end
