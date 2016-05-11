require_relative 'rules'

class Play

	def initialize()

	end	

	def launch!
		puts "\n<< Welcome to Hangman >>\n"		
		welcome
		farewell
	end	

	def welcome		
		rules = Rules.new
		puts "Make 6 wrong guesses and you lose. Max Score : 600\n\n"		
		puts rules.blanksFromWord
		user_input = nil
		strikes = 0
		until strikes == 6
			print ("\nEnter letter > ")
			user_input = gets.chomp.downcase.strip.downcase
			if user_input.length > 1
				puts "Enter one alphabet at a time. Try again.\n"
				puts rules.blanksFromWord
				next
			end 	
			result = rules.checkWithWord(user_input)
			case result.split("|")[0]
				when 'strike'
					strikes = strikes + 1
					puts "Wrong! You have " + (6 - strikes.to_i).to_s + " chances left."
					puts result.split("|")[1]
				when 'match'
					puts "Match! Good going. " + (6 - strikes.to_i).to_s + " chances left."
					puts result.split("|")[1]
				when 'repeat'
					puts "You have already used '" +user_input + "'. Try another alphabet.\n"
					puts result.split("|")[1]			
				when 'win'
					puts rules.getWord
					puts "\nYou win"
					break
				end
			print "\n"
		end	
		if strikes == 6
			puts "You lose. The word was " + rules.getWord
		end		
		puts "\nYour score : " + ((6 - strikes)*100).to_s

		print ("\nPlay again ? (y or n) > ")
		user_input = gets.chomp.downcase.strip.downcase
		if user_input == "y"
			puts "\n"
			welcome		
		end				
	end

	def farewell
		puts "\n<< Thank you for playing. >>\n\n"
	end	
		
end	