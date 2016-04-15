class ChangeTypesOfColumnsInEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :birthday, :date
    remove_column :employees, :date_of_acception, :date
    add_column :employees, :birthday, :string
    add_column :employees, :date_of_acception, :string
  end
end
