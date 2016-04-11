class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :surname
      t.string :name
      t.string :patronymic
      t.string :position
      t.integer :code
      t.string :address
      t.text :note
      t.date :birthday
      t.integer :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
