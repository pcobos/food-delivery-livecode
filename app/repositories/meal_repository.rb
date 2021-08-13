require_relative "../models/meal"
require 'csv'
require 'pry-byebug'

class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    # Array for storing the meal instances
    @meals = []
    # Repos play the role of DBs in this exercise, therefore they are responsible to keep track of all ids already used and to allocate new ids to new records
    @next_id = 1
    # In the next line we are calling our load csv method only in case the the file exists
    load_csv if File.exist?(@csv_path)
  end

  def create(meal)
    # we start by assigning an id to the first meal
    meal.id = @next_id 
    # then we push the meal to the @meals array
    @meals << meal
    # Once the meal is stored in the array, we increment the @next_id to avoid having records with the same id
    @next_id += 1
    # every new created meal should be saved in a row in the CSV (first row = headers) (FAILED - 4)
    save_to_csv
  end

  def all
    @meals 
  end

  def find(id)
    @meals.detect { |meal| meal.id == id}
  end

  private
  
  # Following method is responsible for loading the csv file and pushing the new meals to it as well
  def load_csv
    # This line is for the csv options that we will pass when iterating over the CSV file rows
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      # binding.pry
      @meals << Meal.new(row)
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  def save_to_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << ['id', 'name', 'price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end