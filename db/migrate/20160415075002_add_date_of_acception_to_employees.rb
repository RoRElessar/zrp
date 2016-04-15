class AddDateOfAcceptionToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :date_of_acception, :date
  end
end
