class User < ApplicationRecord
  def moderator?
    role == 'moderator'
  end
end
