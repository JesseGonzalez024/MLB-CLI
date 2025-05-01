require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative '../gameplay/game'
require_relative '../gameplay/team'
require_relative '../gameplay/pitcher'






class Scraper

  def start_scraper(user_month, user_date)

    mlb_url = "https://www.mlb.com/scores/2025-#{user_month}-#{user_date}"
    doc = Nokogiri::HTML(URI.open(mlb_url))
    all_games_divs_wrapper = doc.css('div.gridstyle__GridWrapper-sc-1527xnm-0.kOpRHA')

    if all_games_divs_wrapper.empty?
      puts "*** ERROR ERROR ERROR ***"
      puts
      puts "*** All Games Wrapper not found. Check the class or URL ***"
    else
  
      all_games_divs = all_games_divs_wrapper.css('div.grid-itemstyle__GridItemWrapper-sc-1q4b3xf-0.LmgrX')
      
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
        away_team = team_divs[0].text
        home_team = team_divs[1].text

       away_team_obj = Team.find_by_name(away_team)
       home_team_obj = Team.find_by_name(home_team)

            
        game = Game.new(index + 1, user_date, away_team, home_team)
            
          pitchers_div = game_div.css('div.PlayerMatchupLayerstyle__PlayerMatchupLayerWrapper-sc-1dj9z50-0.iSuMKo.matchup-wrapper')
      
          pitchers_div .css('a[data-testid="link"]').each do |pitcher|
              
            # name = pitcher.at_css('div[name]')&.[]('name')
            # profile_url = pitcher['href']
            img_tag = pitcher.css('img').first
            # img_url = img_tag ? img_tag['src'] : nil
              # puts "Player: #{name}"
              # puts "Profile URL: #{profile_url}"
              # puts "Image URL: #{img_url}"
              # profile_url = pitcher['href']
              # img_tag = pitcher.css('img').first
              img_url = img_tag ? img_tag['src'] : nil
              # puts "Player: #{name}"
              # puts "Profile URL: #{profile_url}"
              # puts "Image URL: #{img_url}"
              #

            # game.starting_pitchers << Pitcher.new(name, profile_url, img_url)
            # 
             game.starting_pitchers << Pitcher.new(pitcher.at_css('div[name]')&.[]('name'), pitcher['href'], img_url)
          end
            
          if game.starting_pitchers.length == 2

            game.starting_pitchers[0].team = away_team_obj
            game.starting_pitchers[1].team = home_team_obj
            puts 
            puts "#{game.away_team} vs #{game.home_team}"
            puts "Starting Pitcher #{game.starting_pitchers[0].name} v Starting Pitcher #{game.starting_pitchers[1].name}"
            puts "--------------------------------------------"
            puts
          else 
            puts "***Starting Pitcher not found for #{game.away_team} or #{game.home_team}***"
            puts "--------------------------------------------"
            puts
          end

          Team.add_pitcher_to_starting_rotaton(game.starting_pitchers)
        end
      end
    end
  end

  # def scrape_all_pitchers_and_add_to_team_rotation

  # end


end







