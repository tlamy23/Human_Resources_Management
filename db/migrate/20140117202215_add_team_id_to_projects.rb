class AddTeamIdToProjects < ActiveRecord::Migration
  def change
  	change_table :projects do |t|
  		t.belongs_to :team
  	end
  end
end
