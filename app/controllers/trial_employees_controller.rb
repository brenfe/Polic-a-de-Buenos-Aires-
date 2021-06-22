class TrialEmployeesController < ApplicationController
  before_action :set_trial_employee, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /registrations or /registrations.json
  def index
    @trial_employees = TrialEmployee.all
  end

  # GET /registrations/1 or /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @trial_employee = TrialEmployee.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations or /registrations.json
  def create
    @trial_employee = TrialEmployee.new(trial_employee_params)

    respond_to do |format|
      if @trial_employee.save
        format.html { redirect_to @trial_employee, notice: "El registro fue creado con éxito." }
        format.json { render :show, status: :created, location: @trial_employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trial_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1 or /registrations/1.json
  def update
    respond_to do |format|
      if @trial_employee.update(trial_employee_params)
        format.html { redirect_to @trial_employee, notice: "El registro fue modificado con éxito." }
        format.json { render :show, status: :ok, location: @trial_employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trial_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1 or /registrations/1.json
  def destroy
    @trial_employee.destroy
    respond_to do |format|
      format.html { redirect_to trial_employee_path, notice: "El registro fue eliminado con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trial_employee
      @trial_employee = TrialEmployee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trial_employee_params
      params.require(:trial_employee).permit(:employee_id, :trial_id)
    end
end
