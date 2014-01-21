class AddTeamToEmployees < ActiveRecord::Migration
  def change
  	change_table :employees do |t|
  		t.belongs_to :team
  	end
  end
end
