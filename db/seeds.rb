# ddd - dummy demo data

# Users
admin_user = User.new(email: 'admin@farsharing.domain',
                      password: 'adminadmin',
                      password_confirmation: 'adminadmin',
                      confirmed_at: DateTime.now - 1)

user_user = User.create(email: 'user@farsharing.domain',
                        password: 'useruser',
                        password_confirmation: 'useruser',
                        confirmed_at: DateTime.now - 1)

[admin_user, user_user].each do |user|
  user.skip_confirmation!
  user.save!
end


# Features
pharmacy_feature = Feature.new(name: 'Pharmacy')
supermarket_feature = Feature.new(name: 'Supermarket')

[pharmacy_feature, supermarket_feature].each do |feature|
  feature.save!
end


# Locations
small_ville = Location.new(name: 'Smallville', features: [pharmacy_feature])
big_ville = Location.new(name: 'Metropolis', features: [pharmacy_feature, supermarket_feature])

[small_ville, big_ville].each do |location|
  location.save!
end

# Cars
small_car = Car.new(name: 'Beetly', manufacture: 'VW', make: 'Beetle', license_plate: 'SAW - SL 1', num_seats: 3, description: 'The coolest car unalive')
big_car = Car.new(name: 'Roove', license_plate: 'SAW - SL 8', num_seats: 5)

[small_car, big_car].each do |car|
  car.save!
end
