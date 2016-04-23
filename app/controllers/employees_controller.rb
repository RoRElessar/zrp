class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.search(params[:search])
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @table = Table.new(employee_id: :employee)
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Работник успешно создан.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    unless @employee.fired?
      respond_to do |format|
        if @employee.update(employee_params)
          format.html { redirect_to @employee, notice: 'Работник успешно обновлен.' }
          format.json { render :show, status: :ok, location: @employee }
=begin
        elsif @employee.update(fired_params)
          format.html { redirect_to @employee, notice: 'Работник был уволен.' }
=end
        else
          format.html { render :edit }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @employee, alert: 'Работник уволен, редактирование невозможно.'
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Работник успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:surname, :name, :patronymic, :position, :code, :address, :note, :birthday,
                                       :phone, :email, :table_number, :date_of_acception, :fired, :fired_date)
    end

=begin
    def fired_params
      params.require(:employee).permit(:fired, :fired_date)
    end
=end

end
