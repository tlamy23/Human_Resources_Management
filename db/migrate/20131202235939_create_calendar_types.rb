class CreateCalendarTypes < ActiveRecord::Migration
  def change
    create_table :calendar_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
