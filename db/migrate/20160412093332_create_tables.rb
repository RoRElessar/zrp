class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :table_number
      t.integer :days_worked
      t.integer :days_of_sickness
      t.integer :vacation_days
      t.integer :unpaid_vacation_days

      t.timestamps null: false
    end
  end
end
