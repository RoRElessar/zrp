ActiveAdmin.register Employee do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
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

  show do
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
    end
  end

  form do |f|
    f.inputs "Данные о работнике" do
      f.input :surname
      f.input :name
      f.input :patronymic
      f.input :position
      f.input :code
      f.input :birthday
      f.input :address
      f.input :phone
      f.input :email
      f.input :note
    end
    f.actions
  end

end
