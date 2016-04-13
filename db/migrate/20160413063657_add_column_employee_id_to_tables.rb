class AddColumnEmployeeIdToTables < ActiveRecord::Migration
  def change
    add_column :tables, :employee_id, :integer
  end
end
