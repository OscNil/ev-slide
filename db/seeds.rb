# READ THIS:

# EXECUTE THIS NEXT LINE ONCE AFTER DB:DROP DB:CREATE DB:MIGRATE
# ChargingPost.delete_all
# puts '!!!Clearing all Charging Posts'
# 6.times { |index| ChargingPost.create!() }
# puts '!!!Creating six Charging Posts'

##########


puts '!!!Clearing all charging sessions'
ChargingSession.delete_all
puts 'All charging sessions deleted!'

puts '!!!Clearing all queueing sessions'
Queueing.delete_all
puts 'All queueing sessions deleted!'

puts '!!!Clearing all users'
User.delete_all
puts 'Users deleted!'

puts 'Creating users...'

user_1 = User.create!(password: '123456',
                      email: 'useremail@domain.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/username',
                      first_name: 'First',
                      last_name: 'Last',
                      car_plate: 'ABC 123',
                      points: 81)

puts 'User 1 created!'

user_2 = User.create!(password: '123456',
                      email: 'useremail@domain.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/username',
                      first_name: 'First',
                      last_name: 'Last',
                      car_plate: 'DEF 456',
                      points: -22)

puts 'User 2 created!'
user_3 = User.create!(password: '123456',
                      email: 'useremail@domain.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/username',
                      first_name: 'First',
                      last_name: 'Last',
                      car_plate: 'GHI 789',
                      points: 32)
puts 'User 3 created!'

user_4 = User.create!(password: '123456',
                      email: 'useremail@domain.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/username',
                      first_name: 'First',
                      last_name: 'Last',
                      car_plate: 'CBA 321',
                      points: 50)
puts 'User 4 created!'

user_5 = User.create!(password: '123456',
                      email: 'useremail@domain.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/username',
                      first_name: 'First',
                      last_name: 'Last',
                      car_plate: 'FED 654',
                      points: -6)
puts 'User 5 created!'

user_6 = User.create!(password: '123456',
                      email: 'useremail@domain.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/username',
                      first_name: 'First',
                      last_name: 'Last',
                      car_plate: 'IHG 987',
                      points: -98)

puts 'User 6 created!'

user_7 = User.create!(password: '123456',
                      email: 'useremail@domain.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/username',
                      first_name: 'First',
                      last_name: 'Last',
                      car_plate: 'III 999',
                      points: 29)

puts 'User 7 created!'

user_8 = User.create!(password: '123456',
                      email: 'useremail@domain.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/username',
                      first_name: 'First',
                      last_name: 'Last',
                      car_plate: 'NIT 851',
                      points: -70)

puts 'User 8 created!'

user_9 = User.create!(password: '123456',
                      email: 'useremail@domain.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/username',
                      first_name: 'First',
                      last_name: 'Last',
                      car_plate: 'GGG 777',
                      points: 0)

puts 'User 9 created!'

user_10 = User.create!(password: '123456',
                      email: 'useremail@domain.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/username',
                      first_name: 'First',
                      last_name: 'Last',
                      car_plate: 'AAA 111',
                      points: 0)



puts 'User 10 created!'

puts 'All users created successfully!'

puts 'Creating charging sessions'
puts '!!!Clearing all charging sessions'
ChargingSession.delete_all
puts 'Setting date variable'
rolling_timestamp = Time.current
puts "Current time UTC: #{rolling_timestamp}"


session_1 = ChargingSession.create!(charging_post_id: 1,
                                   user_id: user_7.id,
                                   start_time: rolling_timestamp - 10,
                                   end_time: nil)
puts 'Charging session 1 created!'

session_2 = ChargingSession.create!(charging_post_id: 2,
                                   user_id: user_8.id,
                                   start_time: rolling_timestamp - 8,
                                   end_time: nil)
puts 'Charging session 2 created! '

session_3 = ChargingSession.create!(charging_post_id: 3,
                                   user_id: user_3.id,
                                   start_time: rolling_timestamp - 5,
                                   end_time: nil)
puts 'Charging session 3 created!'

session_4 = ChargingSession.create!(charging_post_id: 4,
                                   user_id: user_4.id,
                                   start_time: rolling_timestamp - 2,
                                   end_time: nil)
puts 'Charging session 4 created! '

session_5 = ChargingSession.create!(charging_post_id: 5,
                                   user_id: user_5.id,
                                   start_time: rolling_timestamp,
                                   end_time: nil)
puts 'Charging session 5 created! '

puts 'All charging sessions created successfully!'


# queueing_1 = Queueing.create!(user_id: user_7.id,
#                               start_time: rolling_timestamp - (0.5 * 3600),
#                               end_time: nil)
# puts 'Queueing no 1 created! (Start: Half an hours ago. End: still ongoing...)'

# queueing_2 = Queueing.create!(user_id: user_8.id,
#                               start_time: rolling_timestamp - (0.45 * 3600),
#                               end_time: nil)
# puts 'Queueing no 2 created! (Start: Less than half an hours ago. End: still ongoing...)'
# puts 'All queueings created successfully!'
