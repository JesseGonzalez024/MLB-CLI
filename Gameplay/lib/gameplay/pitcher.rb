class Pitcher
  attr_accessor :name, :profile_url, :img_url, :team

  @@all = []

  def initialize (name, profile_url, img_url)
    @name = name
    @profile_url = profile_url
    @img_url = img_url
    @team = nil
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find {|pitcher| pitcher.name == name}
  end

  # def self.add_pitcher_to_starting_rotaton
  #   Team.all.each do
      

  #   end
  # end
end

# ADD All Pitcher Scraper methods here