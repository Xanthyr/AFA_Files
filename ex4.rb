cars = 100
space_in_a_car = 4
drivers = 30
passengers = 90
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car
average_passenger_per_car = passengers / cars_driven

#100
puts "There are #{cars} cars available."
#30
puts "There are only #{drivers} drivers available."
#cars - drivers; 100 - 30= 70 cars_not_driven
puts "There will be #{cars_not_driven} empty cars today."
# cars_driven * space_in_a_car; 30 * 4, 120 people
puts "We can transport #{carpool_capacity} people today."
# passengers = 90
puts "We have #{passengers} to carpool today."
#passengers divided by cars_driven, 90 divided by 30 = 3 people per car.
puts "We need to put about #{average_passenger_per_car} in each car."
