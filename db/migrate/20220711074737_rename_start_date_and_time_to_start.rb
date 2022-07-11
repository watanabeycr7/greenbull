class RenameStartDateAndTimeToStart < ActiveRecord::Migration[6.1]
  def change
    rename_column :schedules, :start_date_and_time, :start
  end
end
