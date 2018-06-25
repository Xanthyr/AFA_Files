#!\cip\rubymineprojects\ruby_the_hard_way

arr1 = ["all", "in", "the", "family"]
arr2 = ["aardvark", "anteater"]
class Array
  def all_start_with_a?(*arr)
    if arr.to_s.starts_with? == 'a'
      return true
    end
  end
end


# colors = ['red', 'violet', 'blue']
# result = []
# count = 0
# counter = count += 1
# colors.each do |color|
#   count += 1
#   result.push(color, count)
# end
#
# colors.map {|color|  result.push(color, counter)}


# module MathHelpers
#   def expo(a, b)
#     a ** b
#   end
# end
#
# class Calculator
#   include MathHelpers
#   def square_root(a)
#     a ** 0.5
#   end
# end

# class Person
#   def initialize(first_name, last_name)
#     @first_name = first_name
#     @last_name = last_name
#   end
#
#   def first_name
#     @first_name
#   end
#
#   def last_name
#     @last_name
#   end
#
#   def full_name
#     "#{@first_name} #{@last_name}"
#   end
# end


# class BaseballPlayer
#   def initialize(hits, walks, at_bats)
#     @hits = hits
#     @walks = walks
#     @at_bats = at_bats
#   end
#
#   def batting_average()
#     return(@hits.to_f / @at_bats)
#   end
#
#   def on_base_percentage()
#     return((@hits + @walks).to_f / @at_bats)
#   end
# end

# class Mammal
#   def heartbeat?
#     true
#   end
# end
#
# class Dog < Mammal
# end


# module MathHelper
#   def multiply_by_two(number)
#     number.to_i * 2
#   end
# end
#
# class Homework
#   include MathHelper
# end



# module HappyHappy
#   def say_something
#     "Happy happy, joy joy"
#   end
# end
#
# class Person
#   include HappyHappy
# end
#
# class Alien
#   include HappyHappy
# end



# module Clueless
#   def funny
#   "AS IF?!"
#   end
# end
#
# class Actress
#   include Clueless
# end



# class Person
#   def initialize(age)
#     @age = age
#   end
#
#   def age
#     @age
#   end
#   def new_year
#     @age += 1
#   end
# end
#
# class WaterBottle
#   def initialize(size)
#     @size = size
#   end
#
#   def size
#     @size
#   end
# end
#
# class Lamp
#   def self.about_me
#     "We brighten up people's lives."
#   end
# end
#
#
# class Insect
#   def initialize(age_in_days)
#     @age_in_days = age_in_days
#   end
#
#   def age_in_years
#     @age_in_days.to_f / 365
#   end
# end
#
#
#
#
# class Dog
#   def initialize(name)
#     @name = name
#   end
#
#   def bark
#     "Ruff ruff"
#   end
# end




# ages = [[:frank, 42], [:sue, 77],[:granny, 77]]
#
# ages.find do |name, age|
#   age == 77
# end



# test_scores = [["jon", 99],["sally", 65],["bill", 85]]
#
# test_scores.select do |name, score|
#   score > 80
# end
#
# puts




# sports = ["basketball", "baseball", "football"]
# count = 0
# sports.each do |iteration|
#   puts count.to_s + ". " + iteration
#   count += 1
# end
#
#





# result = []
# weird_array = ["Blah", :meow, 42, 90, :building]
#
# weird_array.each do |x|
#   if x.instance_of?(Symbol)
#     result.push(x)
#   end
# end
#
# puts result





def funify(array)
  array.push("fun")
end

def more_fun(array)
  array[0] = "FUN FUN"
end

def increment_variable(variable)
  return(variable + 1)
end

# array = ["snake", "rat", "cat", "dog"]
# array.each do |animal|
#   puts animal if animal[0] == "s"
# end
#
# result = []
#
# first_names = ["Hamburglar", "Grimace", "Ronald"]
# last_name = "McDonald"
#
# first_names.each do |names|
#   full_names = names + " " + last_name
#   result.push(full_names)
# end
#
# puts result

# new_arr = []
# # personality_types = ["bad", "good", "great"]
# #
# # personality_types.each do |x|
# #   new_arr.push(x + " person")
# # end
# #
# # puts new_arr