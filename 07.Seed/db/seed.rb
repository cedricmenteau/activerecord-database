require './models/recipe'
require 'nokogiri'
require 'open-uri'

# Seed you database with recipe data from marmiton

puts "Seeding database..."

# Here is a sample of ingredients (you are free to add some !)
ingredients = ["curry", "crevettes", "agneau", "pomme", "orange", "café", "asperges", "celeri", "dorade"]

# Your code goes here 
# 1. Scrape recipes data from marmiton for these ingredients
sample.each do |ingredient|
	html_file = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}")
	recipes = Nokogiri::HTML(html_file)
# 2. Create associated recipe records in the DB
	recipes.search('.m_search_result').each do |element|
		recipe_name = element.search('.m_search_titre_recette a').inner_text
		recipe_description = element.search('.m_search_result_part4').inner_text
		recipe_length = recipe_description.match(/(\d+)\smin/)[1].to_i
		recipe_difficulty = rand(1..9)
		Recipe.create(name: recipe_name, description: recipe_description, length: recipe_length, difficulty: recipe_difficulty)
  end
end                                             
