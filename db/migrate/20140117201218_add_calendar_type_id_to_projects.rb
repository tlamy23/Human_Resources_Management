class AddCalendarTypeIdToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
    	t.belongs_to :calendar_type
    end
  end
end
