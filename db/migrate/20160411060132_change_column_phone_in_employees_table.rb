class ChangeColumnPhoneInEmployeesTable < ActiveRecord::Migration
  def change
    remove_column :employees, :phone, :integer
    add_column :employees, :phone, :integer, limit: 8
  end
end
