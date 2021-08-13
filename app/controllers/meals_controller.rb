require_relative "../views/meals_view"
require_relative "../models/meal"

class MealsController
  def initialize(repository)
    @repository = repository
    # We initialize the view here directly to avoid having to initialize it elsewhere and adding more parameters
    @meals_view = MealsView.new
  end

  def add
    # Ask user for the meal name
    name = @meals_view.ask_user_for("name")
    # Ask user for the meal price (remember to transform it to integer)
    price = @meals_view.ask_user_for("price").to_i
    # Create the instance with said info
    meal = Meal.new(name: name, price: price)
    # Add meal instance to repo by calling the create method
    @repository.create(meal)
    # Finally display all meals for a better user experience
    display_meals
  end

  def list
    # Calls display meals method
    display_meals
  end
  
  # Private methods can only be called inside the class
  private 
  
  def display_meals
    # Call the repository's #all method and store in a variable
    meals = @repository.all
    # Call the view's display method and pass the meals array as an argument
    @meals_view.display(meals)
  end
end