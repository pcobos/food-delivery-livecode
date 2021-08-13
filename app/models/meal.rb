class Meal
  # Ask yourself if the data can only be read or rewritten and choose the right accessor accordingly
  attr_reader :name, :price
  attr_accessor :id

  # Meal class STATE:
  def initialize(attributes = {})
    @id = attributes[:id] #integer
    @name = attributes[:name] #string
    @price = attributes[:price] #float?
  end
end


# Always good to test if what we are doing works. Note that if the last argument that we are passing to a method is a hash, we can skip curly braces
p Meal.new(id: 1, name: "Pizza", price: 3.75)