class AddDateToTables < ActiveRecord::Migration
  def change
    add_column :tables, :date_of_table, :date
    add_column :tables, :closed_month, :boolean, default: false
  end
end
