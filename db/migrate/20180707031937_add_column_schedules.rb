class AddColumnSchedules < ActiveRecord::Migration[5.2]
  # schedulesテーブルにuser_idカラムを追加する。(indexを張る)
  def change
    add_reference :schedules, :user, index: true
  end
end
