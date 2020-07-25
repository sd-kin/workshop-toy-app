class SignUpForm
  include ActiveModel::Model

  attr_accessor :username, :address, :email, :email_confirmation, :check

  validates :username, :address, :email, :email_confirmation, presence: true
  validate :email_confirmed
  validate :box_checked

  def initialize(username: '', address: '', email: '', email_confirmation: '', check: false)
    @username = username.downcase
    @address = address
    @email = email.downcase
    @email_confirmation = email_confirmation
    @check = ActiveRecord::Type::Boolean.new.cast(check)
  end

  def user_attributes
    {
      username: username,
      address: address,
      email: email
    }
  end

  private

  def email_confirmed
    return if email == email_confirmation

    errors.add(:email_confirmation, 'does not match email')
  end

  def box_checked
    return if check

    errors.add(:check, 'you should read and accept')
  end
end
