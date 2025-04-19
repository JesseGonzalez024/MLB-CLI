require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def start_scraper(user_month, user_date)

    mlb_url = "https://www.mlb.com/scores/2025-#{user_month}-#{user_date}"

    doc = Nokogiri::HTML(URI.open(mlb_url))

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
  
            Game.all << game_hash

  
            puts "#{away_team} vs #{home_team}"
            puts "--------------------------------------------"
            puts    
          end
      end
    end
  end
end







