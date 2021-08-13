# TODO: require relevant files to bootstrap the app.
require_relative "app/controllers/meals_controller" 
require_relative "app/repositories/meal_repository" 
require_relative "router" 

MEALS_CSV_FILE = File.join(__dir__, "data/meals.csv")
meal_repository = MealRepository.new(MEALS_CSV_FILE)
# Following syntax also works
# meal_repository = MealRepository.new("data/meals.csv")

meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller)
router.run
