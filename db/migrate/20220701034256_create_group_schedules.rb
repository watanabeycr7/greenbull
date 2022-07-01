class CreateGroupSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :group_schedules do |t|
      t.references :group, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true
      t.timestamps
    end
  end
end
