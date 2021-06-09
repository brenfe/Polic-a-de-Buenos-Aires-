class DefendantsController < ApplicationController
  before_action :set_defendant, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /defendants or /defendants.json
  def index
    @defendants = Defendant.all
  end

  # GET /defendants/1 or /defendants/1.json
  def show
  end

  # GET /defendants/new
  def new
    @defendant = Defendant.new
  end

  # GET /defendants/1/edit
  def edit
  end

  # POST /defendants or /defendants.json
  def create
    @defendant = Defendant.new(defendant_params)

    respond_to do |format|
      if @defendant.save
        format.html { redirect_to @defendant, notice: "Defendant was successfully created." }
        format.json { render :show, status: :created, location: @defendant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @defendant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /defendants/1 or /defendants/1.json
  def update
    respond_to do |format|
      if @defendant.update(defendant_params)
        format.html { redirect_to @defendant, notice: "Defendant was successfully updated." }
        format.json { render :show, status: :ok, location: @defendant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @defendant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /defendants/1 or /defendants/1.json
  def destroy
    @defendant.destroy
    respond_to do |format|
      format.html { redirect_to defendants_url, notice: "Defendant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_defendant
      @defendant = Defendant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def defendant_params
      params.require(:defendant).permit(:person_id)
    end
end
