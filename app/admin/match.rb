ActiveAdmin.register Match do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :team1_id, :team2_id, :winning_team_id

end
