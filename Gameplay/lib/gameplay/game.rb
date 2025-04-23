# Calendar

#
# def is_series_over (away_team, home_team)
#   # Check if the series is over
#   # tomorrows_date = @date + 1
#   #
#   # returns true or false
# end

# def did_teams_play_the_day_before(away_team, home_team)
#   # Check if the series was played yesterday
#   # yesterdays_date = @date - 1

#   # return true or false
# end
# 
class Game
  attr_accessor :index, :date, :away_team_starting_pitcher, :away_team, :home_team, :home_team_starting_pitcher, :innings
  
  @@all = []

  def initialize (index, date, away_team_starting_pitcher, away_team, home_team, home_team_starting_pitcher, innings, final_score_url = nil, final_score = nil)
    @index = index
    @date = date
    @away_team = away_team
    @away_team_starting_pitcher = away_team_starting_pitcher
    @home_team = home_team
    @home_team_starting_pitcher = home_team_starting_pitcher
    @innings = innings

    @@all << self
  end

  def self.all
    @@all
  end

  

  # def self.find_by_id(index)
  #   @@all.find {|game| character.index == index}
  # end

end
