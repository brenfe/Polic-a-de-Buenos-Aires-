class DamagesController < ApplicationController
  before_action :set_damage, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /damages or /damages.json
  def index
    @damages = Damage.all
    @damages = @damages.where(["table_type LIKE :filter", :filter => "%" + params[:filter] + "%"]) unless params[:filter].blank?
    @damages = @damages.page(params[:page]) || 1
  end

  # GET /damages/1 or /damages/1.json
  def show
  end

  # GET /damages/new
  def new
    @damage = Damage.new
  end

  # GET /damages/1/edit
  def edit
  end

  # POST /damages or /damages.json
  def create
    @damage = Damage.new(damage_params)

    respond_to do |format|
      if @damage.save
        format.html { redirect_to @damage, notice: "Daño creado con éxito." }
        format.json { render :show, status: :created, location: @damage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @damage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /damages/1 or /damages/1.json
  def update
    respond_to do |format|
      if @damage.update(damage_params)
        format.html { redirect_to @damage, notice: "Daño actualizado con éxito." }
        format.json { render :show, status: :ok, location: @damage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @damage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /damages/1 or /damages/1.json
  def destroy
    @damage.destroy
    respond_to do |format|
      format.html { redirect_to damages_url, notice: "Daño eliminado con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_damage
      @damage = Damage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def damage_params
      params.require(:damage).permit(:table_type, :person_id, :property_id)
    end
end
