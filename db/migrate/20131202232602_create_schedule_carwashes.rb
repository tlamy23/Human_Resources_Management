class CreateScheduleCarwashes < ActiveRecord::Migration
  def change
    create_table :schedule_carwashes do |t|
      t.date :date
      t.integer :turn
      t.belongs_to :employee

      t.timestamps
    end
  end
end
