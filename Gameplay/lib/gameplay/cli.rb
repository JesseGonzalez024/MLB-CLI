require 'open-uri'
require 'nokogiri'
require 'pry'

class CLI

  def call
    greeting
    Scraper.new.start_scraper(@user_month, @user_date)
    select_game
    
  
    # New method to check series status, yesterday and tomorrow
    # Scraper.new.check_series_status(@user_month, @user_date)
    # Continue with CLI

  end

  def greeting
    puts 
    puts "--------------------------------------------"
    puts "Hello and Welcome to the MLB Bets Scraper!"
    puts "--------------------------------------------"
    puts
    puts "Please enter the month (MM):"
      @user_month = gets.chomp 
    puts "Please enter the date (DD):"
      @user_date = gets.chomp
    puts

      ## Odin Project Testing methods
  end

  def select_game
    puts
    puts "--------------------------------------------"
    puts "Please enter the game number you want to review:"
    game_number = gets.chomp.to_i

    game = Game.find_by_id(game_number)
    
    puts
    puts "--------------------------------------------"
    puts "Is this your game?"
    puts
    puts "#{game.away_team} vs #{game.home_team}"
    puts "--------------------------------------------"
  end
end