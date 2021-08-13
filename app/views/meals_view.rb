class MealsView
  def display(meals)
    # iterate over the meals array to display a list
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} : #{meal.price}€"
    end
  end

  # Dynamic method to avoid repeating ourselves
  def ask_user_for(something)
    # Print question asking for the name, price, or something else
    puts "What is the #{something.capitalize}?"
    print "> "
    # return the user´s input
    return gets.chomp
  end
end
