# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '!!!Clearing all charging sessions'
ChargingSession.delete_all
puts 'All charging sessions deleted!'

puts '!!!Clearing all users'
User.delete_all
puts 'Users deleted!'

puts 'Creating users...'

user_1 = User.create!(password: '123456',
                      email: 'petra@ikea.com',
                      photo: 'https://kitt.lewagon.com/placeholder/users/pzyee',
                      first_name: 'Petra',
                      last_name: 'Elandersson',
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

# HEAR YE
# HEAR YE
# EXECUTE THIS NEXT LINE ONCE AFTER DB:DROP DB:CREATE
# 28.times { |index| ChargingPost.create!() }

puts 'Creating charging sessions'
puts '!!!Clearing all charging sessions'
ChargingSession.delete_all
puts 'Setting date variable'
rolling_timestamp = Time.now.utc

session_1 = ChargingSession.create!(charging_post_id: 1,
                                   user_id: user_1.id,
                                   start_time: rolling_timestamp - (2 * 3600),
                                   end_time: rolling_timestamp - (3600))
puts 'Charging session 1 created! (Start: 2 hours ago. End: 1 hour ago.)'

session_2 = ChargingSession.create!(charging_post_id: 2,
                                   user_id: user_1.id,
                                   start_time: rolling_timestamp - (1.5 * 3600),
                                   end_time: rolling_timestamp - (0.75 * 3600))
puts 'Charging session 2 created! (Start: 1 and a half hours ago. End: 45 minutes ago.)'

session_3 = ChargingSession.create!(charging_post_id: 3,
                                   user_id: user_1.id,
                                   start_time: rolling_timestamp - (80 * 60),
                                   end_time: rolling_timestamp - (10 * 60))
puts 'Charging session 3 created! (Start: 80 minutes ago. End: Ten minutes ago.)'

session_4 = ChargingSession.create!(charging_post_id: 4,
                                   user_id: user_1.id,
                                   start_time: rolling_timestamp - (3600),
                                   end_time: nil)
puts 'Charging session 4 created! (Start: 1 hour ago. End: still ongoing...)'

session_5 = ChargingSession.create!(charging_post_id: 5,
                                   user_id: user_2.id,
                                   start_time: rolling_timestamp - (0.5 * 3600),
                                   end_time: nil)
puts 'Charging session 5 created! (Start: Half an hours ago. End: Ongoing.)'

puts 'All charging sessions created successfully!'

