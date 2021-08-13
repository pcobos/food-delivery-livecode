# TODO: implement the router of your app.
class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    @running = true
  end

  def run
    # while the method is running, keep showing the menu
    while @running
      # Display the menu options
      display_menu
      # Get the user input
      choice = gets.chomp.to_i
      # Call a method that takes care of pointing to the right action
      route_action(choice)
    end
  end

  def display_menu
    puts "-----------------"
    puts "------MENU-------"
    puts "1- Add a new meal"
    puts "2- List all meals"
    puts "5- Exit"
    print ">"
  end

  def route_action(choice)
    case choice # ==> number 1, 2 or 5
    when 1 then @meals_controller.add
    when 2
      @meals_controller.list
    when 5 then stop!
    else puts "Try again"
    end  
  end

  def stop!
    @running = false
  end
end