class Schedule < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :start
    validates :end
  end

  has_many :user_schedules, dependent: :destroy
  has_many :users, through: :user_schedules
  has_many :group_schedules, dependent: :destroy
  has_many :groups, through: :group_schedules
end
