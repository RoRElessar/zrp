class ChangeCodeColumnInEmployeesTable < ActiveRecord::Migration
  def change
    remove_column :employees, :code, :integer
    add_column :employees, :code, :integer, limit: 8
  end
end
