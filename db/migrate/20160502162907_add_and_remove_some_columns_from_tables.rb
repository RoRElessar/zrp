class AddAndRemoveSomeColumnsFromTables < ActiveRecord::Migration
  def change
    remove_column :tables, :days_of_sickness, :integer
    remove_column :tables, :vacation_days, :integer
    add_column :tables, :days_of_sickness_previous_5, :integer
    add_column :tables, :days_of_sickness_previous, :integer
    add_column :tables, :days_of_sickness_current_5, :integer
    add_column :tables, :days_of_sickness_current, :integer
    add_column :tables, :days_of_sickness_pre_previous_5, :integer
    add_column :tables, :days_of_sickness_pre_previous, :integer
    add_column :tables, :vacation_days_current, :integer
    add_column :tables, :vacation_days_next, :integer
    add_column :tables, :vacation_days_next_2, :integer
    add_column :tables, :courses, :integer
    add_column :tables, :different, :integer
    add_column :tables, :bonus, :integer
    add_column :tables, :of_hard_work, :integer
    add_column :tables, :excess_fare, :integer
    add_column :tables, :night_hours, :integer
    add_column :tables, :days_of_substitution, :integer
    add_column :tables, :days_of_pluralism, :integer
  end
end
