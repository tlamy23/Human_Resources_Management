class CreateDayOffs < ActiveRecord::Migration
  def change
    create_table :day_offs do |t|
      t.string :name
      t.date :date
      t.belongs_to :calendar_type

      t.timestamps
    end
  end
end
