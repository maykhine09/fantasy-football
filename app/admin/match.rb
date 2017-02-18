ActiveAdmin.register Match do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :team1_id, :team2_id, :winning_team_id,
:games_attributes => [
      :id,
      :match_id,
      :team1_score,
      :team2_score,
      :_destroy
    ]

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
    panel "Games" do
      table_for a.games do
        column :team1_score
        column :team2_score
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :team1
      f.input :team2
      f.input :winning_team
    end
    f.inputs do
      f.has_many :games, allow_destroy: true, heading: 'Games' do |g|
        g.input :team1_score
        g.input :team2_score
      end
    end
    f.actions
  end

end
