class UserMutator
  class << self
    def create_regular_user(username: '', address: '', email: '')
      lat, lon = Geocoder.search(address).first.coordinates

      user = User.new(
        username: username,
        address: address,
        email: email,
        role: 'regular',
        position_lat: lat,
        position_lon: lon,
        banned: false,
        deleted: false
      )

      user.save
      user
    end

    def update_regular_user(user, username: '', address: '', email: '')
      lat, lon = Geocoder.search(address).first.coordinates unless address.blank?

      attributes = {
        username: username,
        address: address,
        email: email,
        position_lat: lat,
        position_lon: lon
      }

      attributes = attributes.reject { |_k,v| v.blank? }

      user.update(attributes)
      user
    end

    def create_moderator_user(username: '', address: '', email: '', workplace: '', profession: '')
      lat, lon = Geocoder.search(address).first.coordinates

      user = User.new(
        username: username,
        address: address,
        email: email,
        role: 'moderator',
        workplace: workplace,
        profession: profession,
        position_lat: lat,
        position_lon: lon,
        banned: false,
        deleted: false
      )

      user.save
      user
    end

    def update_moderator_user(user, username: '', address: '', email: '', workplace: '', profession: '', banned: nil, deleted: nil)
      lat, lon = Geocoder.search(address).first.coordinates unless address.blank?

      attributes = {
        username: username,
        address: address,
        email: email,
        workplace: workplace,
        profession: profession,
        banned: banned,
        deleted: deleted,
        position_lat: lat,
        position_lon: lon
      }

      attributes = attributes.reject { |_k,v| v.blank? }

      user.update(attributes)
      user
    end
  end
end
