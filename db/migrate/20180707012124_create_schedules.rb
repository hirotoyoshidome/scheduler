class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :plan_date
      t.string :level
      t.timestamps
    end
  end
end
