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
    unless @employee.fired?
      respond_to do |format|
        if @table.update(table_params)
          format.html { redirect_to employee_table_path(@employee, @table), notice: 'Табель успешно обновлен.' }
          format.json { render :show, status: :ok, location: @table }
        else
          format.html { render :edit }
          format.json { render json: @table.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to employee_path(@employee), alert: 'Работник уволен, редактирование табеля невозможно.'
    end
  end

  private

  def table_params
    params.require(:table).permit(:employee_id, :days_worked, :unpaid_vacation_days, :days_of_sickness_previous_5,
                                  :days_of_sickness_previous, :days_of_sickness_current_5, :days_of_sickness_current,
                                  :days_of_sickness_pre_previous_5, :days_of_sickness_pre_previous, :vacation_days_current,
                                  :vacation_days_next, :vacation_days_next_2, :courses, :different, :bonus, :of_hard_work,
                                  :excess_fare, :night_hours, :days_of_substitution, :days_of_pluralism, :date_of_table,
                                  :closed, :indexation)
  end

end
