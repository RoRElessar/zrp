class RemoveTableNumberFromTables < ActiveRecord::Migration
  def change
    remove_column :tables, :table_number, :integer
    add_column :employees, :table_number, :integer
  end
end
