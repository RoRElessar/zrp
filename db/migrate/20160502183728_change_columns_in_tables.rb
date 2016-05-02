class ChangeColumnsInTables < ActiveRecord::Migration
  def change
    remove_column :tables, :bonus, :integer
    add_column :tables, :bonus, :decimal, precision: 12, scale: 2
    remove_column :tables, :of_hard_work, :integer
    add_column :tables, :of_hard_work, :decimal, precision: 12, scale: 2
    remove_column :tables, :different, :integer
    add_column :tables, :different, :decimal, precision: 12, scale: 2
    remove_column :tables, :excess_fare, :integer
    add_column :tables, :excess_fare, :decimal, precision: 12, scale: 2
    add_column :tables, :indexation, :decimal, precision: 5, scale: 2
    remove_column :tables, :courses, :integer
    add_column :tables, :courses, :decimal, precision: 12, scale: 2
  end
end
