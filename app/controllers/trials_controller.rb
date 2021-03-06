class TrialsController < ApplicationController
  before_action :set_trial, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /trials or /trials.json
  def index
    @trials = Trial.all
    @trials = @trials.page(params[:page]) || 1
  end

  # GET /trials/1 or /trials/1.json
  def show
  end

  # GET /trials/new
  def new
    @trial = Trial.new
  end

  # GET /trials/1/edit
  def edit
  end

  # POST /trials or /trials.json
  def create
    @trial = Trial.new(trial_params)

    respond_to do |format|
      if @trial.save
        format.html { redirect_to @trial, notice: "Juicio creado con éxito." }
        format.json { render :show, status: :created, location: @trial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trials/1 or /trials/1.json
  def update
    respond_to do |format|
      if @trial.update(trial_params)
        format.html { redirect_to @trial, notice: "Juicio actualizado con éxito." }
        format.json { render :show, status: :ok, location: @trial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trials/1 or /trials/1.json
  def destroy
    @trial.destroy
    respond_to do |format|
      format.html { redirect_to trials_url, notice: "Juicio eliminado con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trial
      @trial = Trial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trial_params
      params.require(:trial).permit(:details, :date, :report_id)
    end
end
