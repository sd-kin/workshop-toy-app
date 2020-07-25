class ModeratorSignUpForm
  include ActiveModel::Model

  attr_accessor :username, :address, :email, :email_confirmation, :check, :profession, :workplace

  validates :username, :address, :email, :email_confirmation, :profession, :workplace, presence: true
  validate :email_confirmed
  validate :box_checked

  def initialize(username: '', address: '', email: '', email_confirmation: '', profession: '', workplace: '', check: false, create_organization: false)
    @username = username.downcase
    @address = address
    @email = email.downcase
    @email_confirmation = email_confirmation
    @profession = profession
    @workplace = workplace
    @check = ActiveRecord::Type::Boolean.new.cast(check)
    @create_organization = ActiveRecord::Type::Boolean.new.cast(create_organization)
  end

  def user_attributes
    {
      username: username,
      address: address,
      email: email,
      profession: profession,
      workplace: workplace
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
