class Team
  
  attr_accessor :abreviation, :name, :division, :league

  @@all = []
  
  def initialize(abreviation, name, division, league)
    @abreviation = abreviation
    @name = name
    @division = division
    @league = league
    @starting_rotation = []
    @record = {}

    @@all << self

  end
  
  def self.all
    @@all
  end

  def self.find_by_abreviation(abreviation)
    @@all.find { |team| team.abreviation == abreviation }
  end

  def self.find_by_name(name)

    binding.pry
    @@all.find do |team| 
      if team.name.include?(name) 
        return team
      end
    end
  end

  def self.find_by_division(division)
    @@all.select { |team| team.division == division }
  end

  def self.find_by_league(league)
    @@all.select { |team| team.league == league }
  end

  def self.add_pitcher_to_starting_rotaton(pitcher)
    Team.find_by_name(pitcher)

    binding.pry
  end
end