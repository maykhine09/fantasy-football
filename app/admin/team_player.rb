ActiveAdmin.register TeamPlayer do
menu parent: 'Team', :priority => 2
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :team_id, :player1_id, :player2_id
  index do
    selectable_column
    column :team
    column :player1
    column :player2
    actions
  end

  filter :team

  form do |f|
    f.inputs do
      f.input :team
      f.input :player1, :as => :select, :collection => User.all.map{|u| ["#{u.first_name} #{u.last_name}", u.id]}
      f.input :player2, :as => :select, :collection => User.all.map{|u| ["#{u.first_name} #{u.last_name}", u.id]}
    end
    f.actions
  end

end
