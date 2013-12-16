class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :first_lastname
      t.string :second_lastname
      t.belongs_to :calendar_type

      t.timestamps
    end
  end
end
