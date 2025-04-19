require 'open-uri'
require 'nokogiri'
require 'pry'

puts 
puts "--------------------------------------------"
puts "Hello and Welcome to the MLB Bets Scraper!"
puts "--------------------------------------------"
puts

puts "Please enter the month (MM):"
  user_month = gets.chomp

puts "Please enter the date (DD):"
  user_date = gets.chomp

mlb_url = "https://www.mlb.com/scores/2025-#{user_month}-#{user_date}"

doc = Nokogiri::HTML(URI.open(mlb_url))

games_to_be_played = []

all_games_wrapper = doc.css('div.gridstyle__GridWrapper-sc-1527xnm-0.kOpRHA')

  if all_games_wrapper.empty?
    puts "*** ERROR ERROR ERROR ***"
    puts
    puts "*** All Games Wrapper not found. Check the class or URL ***"
  else

    all_games_divs = all_games_wrapper.css('div.grid-itemstyle__GridItemWrapper-sc-1q4b3xf-0.LmgrX')
    
    if all_games_divs.empty?
      puts "*** ERROR ERROR ERROR***"
      puts
      puts "No individual game divs found within the All Games Wrapper. The class might have changed."
    else
        puts "--------------------------------------------"
        puts
        puts "#{all_games_divs.length} games are being played today! (#{user_month}/#{user_date}/2025)"
        puts
        puts "--------------------------------------------"

        # Iterate over each game div
        all_games_divs.each_with_index do |game_div, index|

          puts "Game #{index + 1}:"
          puts 
        
          team_divs = game_div.css('div.TeamWrappersstyle__DesktopTeamWrapper-sc-uqs6qh-0.fdaoCu')
          home_team = team_divs[0].text
          away_team = team_divs[1].text

          game_hash = {
            index: index + 1,
            home_team: home_team,
            away_team: away_team,
          }

          games_to_be_played << game_hash

          puts "#{away_team} vs #{home_team}"
          puts "--------------------------------------------"
          puts    
        end
    end
    puts games_to_be_played
  end

puts
puts "Which game do you wish to review? (Enter a number from 1 to #{games_to_be_played.length})"
puts

user_selected_game_to_review = gets.chomp.to_i

# binding.pry

selected_game = games_to_be_played.find do |game|
  game[:index] == user_selected_game_to_review
end

if selected_game
  puts
  puts "You've selected Game #{selected_game[:index]}:"
  puts
  puts "#{selected_game[:away_team]} vs #{selected_game[:home_team]}"
  puts
  # Return the selected game hash
  puts selected_game.inspect # For now, inspect to show the hash; you can modify this as needed
else
  puts
  puts "Invalid selection. Please enter a number between 1 and #{games_to_be_played.length}."
  puts
end