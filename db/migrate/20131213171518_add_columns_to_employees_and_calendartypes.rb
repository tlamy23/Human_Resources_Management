class AddColumnsToEmployeesAndCalendartypes < ActiveRecord::Migration
  def change
  	add_column :employees, :birthdate, :date
  	add_column :employees, :image, :string
  	add_column :calendar_types, :image, :string
  end
end
