class EditUserForm
  include ActiveModel::Model

  attr_accessor :username, :address, :email

  validates :username, :address, :email, presence: true

  def initialize(username: '', address: '', email: '')
    @username = username.downcase
    @address = address
    @email = email.downcase
  end

  def user_attributes
    {
      username: username,
      address: address,
      email: email
    }
  end
end
