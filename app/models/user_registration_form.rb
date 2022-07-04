class UserRegistrationForm
  include ActiveModel::Model
  attr_accessor :email, :password, :name, :user_id, :group_id

  with_options presence: true do
    validates :email
    validates :password
    validates :name
    validates :user_id
    validates :group_id
  end

  def save
    user = User.create(email: email, password: password, name: name)
    UserGroup.create(user_id: user.id, group_id: group_id)
  end

end

