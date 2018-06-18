# #!\cip\rubymineprojects\ruby_the_hard_way
#
# class Box
#   # print class information
#   puts "Type of self = #{self.class}"
#   puts "Name of self = #{self.name}"
# end

# #!\cip\rubymineprojects\ruby_the_hard_way
#
# #define a class
# class Box
#   attr_accessor :width, :height
#
#   # constructor method
#   def initialize(w ,h)
#     @width, @height = w, h
#   end
#
#   # instance method
#   def getArea
#     @width * @height
#   end
# end
#
# # create an object using new
# box1 = Box.new(10, 20)
#
# # create another object using allocate
# box2 = Box.allocate
#
# # call instance method using box1
# a = box1.getArea
# puts "Area of the box is: #{a}"
#
# # call instance method using box2
# a = box2.getArea
# puts "Area of the box is: #{a}"





#!\cip\rubymineprojects\ruby_the_hard_way

# define a class
class Box
  BOX_COMPANY = "TATA Inc"
  BOXWEIGHT = 10
  # initialize = Constructor method
  def initialize(w, h)
    @width, @height = w, h
  end

  # instance method
  def getArea
    @width * @height
  end
end

# create an object
box = Box.new(20, 20)

# call instance methods
a = box.getArea
puts "The area of the box is: #{a}"
puts Box::BOX_COMPANY
puts "Boxweight is: #{Box::BOXWEIGHT}"


# #!\cip\rubymineprojects\ruby_the_hard_way
#
# # define a class
# class Box
#   # constructor method
#   def initialize(w, h)
#     @width, @height = w, h
#   end
#
#   #accessor methods
#   def getWidth
#     @width
#   end
#   def getHeight
#     @height
#   end
#
#   # setter methods
#   def setWidth=(value)
#     @width = value
#   end
#
#   def setHeight=(value)
#     @height = value
#   end
# end
#
# # create an object
# box = Box.new(10,20)
#
# # let us freeze this object
# box.freeze
# if box.frozen?
#   puts "Box object is a frozen object"
# else
#   puts  "Box object is a normal object"
# end
#
# # now try using setter methods
# box.setWidth = 30
# box.setHeight = 50
#
# # use accessor methods
# x = box.getWidth
# y = box.getHeight
#
# puts "Width of the box is: #{x}"
# puts "Height of the box is: #{y}"


# class Box
#   def initialize(w,h)     # Initialize the width and height
#     @width,@height = w, h
#   end
#
#   def +(other)       # Define + to do vector addition
#     Box.new(@width + other.width, @height + other.height)
#   end
#
#   def -@           # Define unary minus to negate width and height
#     Box.new(-@width, -@height)
#   end
#
#   def *(scalar)           # To perform scalar multiplication
#     Box.new(@width*scalar, @height*scalar)
#   end
# end
#
# box = Box.new(10, 20)
# box2 = Box.new(20, 25)
#
# puts box * box2
# puts box2 - box
# puts box + box2
#
#
#
#
#

# #!\cip\rubymineprojects\ruby_the_hard_way
#
# #define a class
# class Box
#   #constructor method
#   def initialize(w, h)
#     @width, @height = w, h
#   end
#
#   # instance method
#   def getArea
#     @width * @height
#   end
# end
#
# # define a subclass
# class BigBox < Box
#
#   # add a new instance method
#   def printArea
#     @area = @width * @height
#     puts "Big box area is :#{@area}"
#   end
# end
#
# # create an object
# box = BigBox.new(10, 20)
#
# # print the area using overridden method
# box.printArea()
#


# #!\cip\rubymineprojects\ruby_the_hard_way
#
# # define a class
# class Box
#   #constructor method
#   def initialize(w, h)
#     @width, @height = w, h
#   end
#
#   # instance method by default, it is public
#   def getArea
#     getWidth() * getHeight
#   end
#
#   # define private accessor methods
#   def getWidth
#     @width
#   end
#   def getHeight
#     @height
#   end
#   # make them private
#   private :getWidth, :getHeight
#
#   # instance method to print area
#   def printArea
#     @area = getWidth() * getHeight
#     puts "Big box area is : #{@area}"
#   end
#   # make it protected
#   protected :printArea
# end
#
# #create an object
# box = Box.new(10, 20)
#
# # call instance methods
# a = box.getArea()
# puts "Area of the box is #{a}"
#
# # try to call a protected method
# box.printArea()






#!\cip\rubymineprojects\ruby_the_hard_way
#
# class Box
#   # constructor method
#   def initialize(w, h)
#     @width, @height = w, h
#   end
#   # define to_s method
#   def to_s
#     "(w:#@width, h:#@height)" # string formatting of the object
#   end
# end
#
# # create an object
# box = Box.new(10, 20)
#
# # to_s method will be called in reference of the string automatically
# puts "String representation of box is : #{box}"


# class Box
#   # constructor method
#   def initialize(w, h)
#     # assign instance variables
#     @width, @height = w, h
#   end
#
#   # Instance method
#   def getArea
#     @width * @height
#   end
#
#   # accessor methods
#   def getWidth
#     @width
#   end
#
#   def getHeight
#     @height
#   end
#
#   # setter methods
#   def setWidth=(value)
#     @width = value
#   end
#
#   def setHeight=(value)
#     @height = value
#   end
# end
#
# # create an object
# box = Box.new(10,20)
#
# # use setter methods
# box.setWidth = 30
# box.setHeight = 50
#
# # use the accessor methods
# x = box.getWidth()
# y = box.getHeight()
#
# a = box.getArea
# puts "Area of the box is : #{a}"
#
# puts "Width of the box is : #{x}"
# puts "Height of the box is : #{y}"
