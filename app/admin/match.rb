ActiveAdmin.register Match do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :team1_id, :team2_id, :winning_team_id

  index do
    selectable_column
    column :id
    column :team1
    column :team2
    column :winning_team
    actions
  end

  filter :team1
  filter :team2
  filter :winning_team

  #for show page
  show do |a|
    attributes_table do
      row :team1
      row :team2
      row :winning_team
    end
  end

  form do |f|
    f.inputs do
      f.input :team1
      f.input :team2
      f.input :winning_team
    end
    f.actions
  end

end
