class AddColumnsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :fired, :boolean, default: false
    add_column :employees, :fired_date, :date, default: nil
  end
end
