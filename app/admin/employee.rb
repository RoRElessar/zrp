ActiveAdmin.register Employee do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :surnae, :name, :patronymic, :position, :code, :birthday, :address, :phone, :email, :note, :fired, :fired_date
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  index do
    id_column
    column :surname
    column :name
    column :patronymic
    column :position
    column :code
    actions
  end

  show title: :surname do
    attributes_table do
      row :surname
      row :name
      row :patronymic
      row :position
      row :code
      row :birthday
      row :address
      row :phone
      row :email
      row :note
      row :fired
      row :fired_date
    end
  end

  form do |f|
    f.inputs 'Данные о работнике' do
      f.input :surname
      f.input :name
      f.input :patronymic
      f.input :position
      f.input :code
      f.input :birthday
      f.input :address
      f.input :phone
      f.input :email
      f.input :fired
      f.input :fired_date
      f.input :note
    end
    f.actions
  end

end
