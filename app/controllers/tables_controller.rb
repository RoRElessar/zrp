class TablesController < ApplicationController

  def create
    @employee = Employee.find(params[:employee_id])
    @table = @employee.tables.create(table_params)

    respond_to do |format|
      if @table.save
        format.html {redirect_to employee_table_path(@employee, @table), notice: 'Табель успешно создан.'}
        format.json {render :show, status: :created, location: @table}
      else
        format.html {render :new}
        format.json {render json: @table.errors, status: :unprocessable_entity}
      end
    end
  end


  def new
    @employee = Employee.find(params[:employee_id])
    @table = Table.new
  end

  def show
    @employee = Employee.find(params[:employee_id])
    @table = Table.find(params[:id])
  end

  def index
    @employee = Employee.find(params[:employee_id])
    @tables = @employee.tables.all
  end

  def edit
    @employee = Employee.find(params[:employee_id])
    @table = @employee.tables.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:employee_id])
    @table = @employee.tables.find(params[:id])
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to @table, notice: 'Табель успешно обновлен.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def table_params
    params.require(:table).permit(:employee_id, :table_number, :days_worked, :days_of_sickness, :vacation_days,
                                  :unpaid_vacation_days).merge(employee_id: :employee)
  end

end
