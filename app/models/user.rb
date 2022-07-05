class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :can_edit, inclusion: { in: [true, false] }

  has_many :user_groups, dependent: :destroy
  has_many :user_schedules
  has_many :groups, through: :user_groups
  has_many :schedules, through: :user_schedules
end
