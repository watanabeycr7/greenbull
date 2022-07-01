class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :name, null: false
      t.datetime :start_date_and_time, null: false
      t.datetime :end_date_and_time, null: false
      t.string :place
      t.text :memo
      t.timestamps
    end
  end
end
