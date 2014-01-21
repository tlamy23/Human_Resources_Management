class AddProjectAdminAndTeamLeaderToProjectsAndTeams < ActiveRecord::Migration
  def change
  	change_table :projects do |t|
  		t.integer :admin, references: :employees
  	end
  	change_table :teams do |t|
  		t.integer :leader, references: :employees
  	end
  end
end
