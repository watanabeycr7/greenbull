class Schedule < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :start_date_and_time
    validates :end_date_and_time
  end
end
