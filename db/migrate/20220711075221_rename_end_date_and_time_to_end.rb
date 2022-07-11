class RenameEndDateAndTimeToEnd < ActiveRecord::Migration[6.1]
  def change
    rename_column :schedules, :end_date_and_time, :end
  end
end
