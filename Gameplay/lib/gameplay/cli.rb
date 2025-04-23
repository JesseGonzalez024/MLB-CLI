require 'open-uri'
require 'nokogiri'
require 'pry'

class CLI

  def call
    greeting
    Scraper.new.start_scraper(@user_month, @user_date)
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
  end

end

