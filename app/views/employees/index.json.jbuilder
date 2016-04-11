json.array!(@employees) do |employee|
  json.extract! employee, :id, :surname, :name, :patronymic, :position, :code, :address, :note, :birthday, :phone, :email
  json.url employee_url(employee, format: :json)
end
