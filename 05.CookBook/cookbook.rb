require_relative 'config/application'
require './models/recipe'

# your program here

while true

	puts "Salut Robuchon, what do you want to do today?"
	puts "1. create a recipe"
	puts "2. delete all recipes"
	puts "3. read your recipes"
	puts "4. Exit"

	choice = gets.chomp.to_i

	break if choice == 4
	if choice == 1
	  puts "Please input the name of your recipe"
	  name = gets.chomp
	  puts "Please input its description"
	  description = gets.chomp
	  puts "Please input its length"
	  length = gets.chomp.to_i
	  puts "Please input its difficulty"
	  difficulty = gets.chomp.to_i             
	  Recipe.create(name: name, description: description, length: length, difficulty: difficulty)
	elsif choice == 2
	  Recipe.all.each {|row| row.destroy}
	elsif choice == 3
	  Recipe.all.each do |recipe|
	  puts "#{recipe.name} #{recipe.description} #{recipe.length} #{recipe.difficulty}"
	end
	else
	  puts "i did not understand"
	end
end