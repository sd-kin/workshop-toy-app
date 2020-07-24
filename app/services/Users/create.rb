module Users
  class Create
    attr_reader :username, :address, :email

    def initialize(username: '', address: '', email: '')
      @username = username
      @address = address
      @email = email
    end

    def call
      lat, lon = Geocoder.search(address).first.coordinates

      user = User.new(
        username: username,
        address: address,
        email: email,
        role: 'regular',
        position_lat: lat,
        position_lon: lon
      )

      user.save
      user
    end
  end
end
