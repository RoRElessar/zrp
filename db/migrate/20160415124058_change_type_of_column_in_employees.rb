class ChangeTypeOfColumnInEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :fired_date, :date
    add_column :employees, :fired_date, :string
  end
end
