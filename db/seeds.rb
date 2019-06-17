# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '!!!Clearing all users'
User.delete_all
puts 'Users deleted!'

puts 'Creating users...'

user_1 = User.create!(password: '123456',
                      email: 'petra@ikea.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/pzyee',
                      first_name: 'Petra',
                      last_name: 'Erlandsson',
                      car_plate: 'ABC 123')
puts 'User 1 created!'

user_2 = User.create!(password: '123456',
                      email: 'dennis@ikea.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/depersson',
                      first_name: 'Dennis',
                      last_name: 'Persson',
                      car_plate: 'DEF 456')

puts 'User 2 created!'
user_3 = User.create!(password: '123456',
                      email: 'lena@ikea.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/leniglnn',
                      first_name: 'Lena',
                      last_name: 'Nigrell',
                      car_plate: 'GHI 789')
puts 'User 3 created!'

user_4 = User.create!(password: '123456',
                      email: 'oscar@ikea.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/oscnil',
                      first_name: 'Oscar',
                      last_name: 'Nilestam',
                      car_plate: 'CBA 321')
puts 'User 4 created!'

user_5 = User.create!(password: '123456',
                      email: 'robert@ikea.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/atmosfeer',
                      first_name: 'Robert',
                      last_name: 'Andersson',
                      car_plate: 'FED 654')
puts 'User 5 created!'

user_6 = User.create!(password: '123456',
                      email: 'anton@ikea.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/atmosfeer',
                      first_name: 'Anton',
                      last_name: 'Svensson',
                      car_plate: 'IHG 987')
puts 'User 6 created!'
puts 'All users created successfully!'

puts '!!!Clearing all charging posts'
ChargingPost.delete_all
puts 'All charging posts deleted!'

puts 'Creating charging posts'
28.times { |index| ChargingPost.create!()
  print "#{index + 1} , " }
puts 'All charging posts created successfully!'

puts 'Creating charging sessions'
puts '!!!Clearing all charging sessions'
# ChargingSession.delete_all
puts 'Setting date variable'
rolling_timestamp = Date.now
puts rolling rolling_timestamp

# session_1 = ChargingSession.create!(charging_post_id: 1,
#                                    user_id: 1,
#                                    start_time: "2019-06-17 06:42:20",
#                                    end_time: "2019-06-17 10:42:20")
# puts 'Charging session 1 created!'

# session_2 = ChargingSession.create!(charging_post_id: 1,
#                                    user_id: 1,
#                                    start_time: "2019-06-17 07:10:20",
#                                    end_time: "2019-06-17 11:10:20")
# puts 'Charging session 2 created!'

# session_1 = ChargingSession.create!(charging_post_id: 1,
#                                    user_id: 1,
#                                    start_time: "2019-06-17 07:45:20",
#                                    end_time: "2019-06-17 11:45:20")
# puts 'Charging session 3 created!'

# session_1 = ChargingSession.create!(charging_post_id: 1,
#                                    user_id: 1,
#                                    start_time: "2019-06-17 08:10:20",
#                                    end_time: "2019-06-17 09:10:20")
# puts 'Charging session 4 created!'

# session_1 = ChargingSession.create!(charging_post_id: 1,
#                                    user_id: 1,
#                                    start_time: "2019-06-17 08:13:20",
#                                    end_time: "2019-06-17 09:13:20")
# puts 'Charging session 5 created!'

# session_1 = ChargingSession.create!(charging_post_id: 1,
#                                    user_id: 1,
#                                    start_time: "2019-06-17 09:22:20",
#                                    end_time: nil)
# puts 'Charging session 6 created!'

# session_1 = ChargingSession.create!(charging_post_id: 1,
#                                    user_id: 1,
#                                    start_time: "2019-06-17 09:32:20",
#                                    end_time: nil)
# puts 'Charging session 7 created!'

# session_1 = ChargingSession.create!(charging_post_id: 1,
#                                    user_id: 1,
#                                    start_time: "2019-06-17 10:12:20",
#                                    end_time: "2019-06-17 12:42:20")
# puts 'Charging session 8 created!'
puts 'All charging sessions created successfully!'

