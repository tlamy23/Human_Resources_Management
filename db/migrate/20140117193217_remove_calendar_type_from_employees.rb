class RemoveCalendarTypeFromEmployees < ActiveRecord::Migration
  def change
  	remove_column :employees, :calendar_type_id, :integer
  end
end
