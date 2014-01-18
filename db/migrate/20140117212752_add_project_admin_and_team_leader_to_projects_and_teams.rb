class AddProjectAdminAndTeamLeaderToProjectsAndTeams < ActiveRecord::Migration
  def change
  	add_column :projects, :admin, :integer
  	add_column :teams, :leader, :integer
  end
end
