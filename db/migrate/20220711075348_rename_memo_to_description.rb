class RenameMemoToDescription < ActiveRecord::Migration[6.1]
  def change
    rename_column :schedules, :memo, :description
  end
end
