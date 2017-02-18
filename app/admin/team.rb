ActiveAdmin.register Team do
menu parent: 'Team', :priority => 1
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :winning_rate

  index do
    selectable_column
    column :id
    column :name
    column :winning_rate
    actions
  end

  filter :name
  filter :winning_rate

  #for show page
  show do |a|
    attributes_table do
      row :name
      row :winning_rate
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :winning_rate
    end
    f.actions
  end
end
