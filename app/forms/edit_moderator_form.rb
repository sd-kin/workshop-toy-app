class EditModeratorForm
  include ActiveModel::Model

  attr_accessor :username, :address, :email, :workplace, :profession, :banned, :deleted

  validates :username, :address, :email, presence: true

  def initialize(username: '', address: '', email: '', workplace: '', profession: '', banned: nil, deleted: nil)
    @username = username.downcase
    @address = address
    @email = email.downcase
    @profession = profession
    @workplace = workplace
    @banned = ActiveRecord::Type::Boolean.new.cast(banned)
    @deleted = ActiveRecord::Type::Boolean.new.cast(deleted)
  end

  def user_attributes
    {
      username: username,
      address: address,
      email: email,
      profession: profession,
      workplace: workplace,
      banned: banned,
      deleted: deleted
    }
  end
end
