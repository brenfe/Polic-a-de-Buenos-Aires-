class ComplainantsController < ApplicationController
  before_action :set_complainant, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /complainants or /complainants.json
  def index
    @complainants = Complainant.all
    @complainants = @complainants.page(params[:page]) || 1
  end

  # GET /complainants/1 or /complainants/1.json
  def show
  end

  # GET /complainants/new
  def new
    @complainant = Complainant.new
  end

  # GET /complainants/1/edit
  def edit
  end

  # POST /complainants or /complainants.json
  def create
    @complainant = Complainant.new(complainant_params)

    respond_to do |format|
      if @complainant.save
        format.html { redirect_to @complainant, notice: "Denunciante creado con éxito." }
        format.json { render :show, status: :created, location: @complainant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @complainant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complainants/1 or /complainants/1.json
  def update
    respond_to do |format|
      if @complainant.update(complainant_params)
        format.html { redirect_to @complainant, notice: "Denunciante actualizado con éxito." }
        format.json { render :show, status: :ok, location: @complainant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @complainant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complainants/1 or /complainants/1.json
  def destroy
    @complainant.destroy
    respond_to do |format|
      format.html { redirect_to complainants_url, notice: "Denunciante eliminado con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complainant
      @complainant = Complainant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complainant_params
      params.require(:complainant).permit(:person_id)
    end
end
