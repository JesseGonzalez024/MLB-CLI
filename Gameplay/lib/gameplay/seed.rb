# require_relative '../gameplay/team'

# Run Sead once to generate a seed for the game.
# All 30 Teams

#AL_EAST = ["BAL", "BOS", "NYY", "TB", "TOR"]
BAL = Team.new("BAL", "Baltimore Orioles", "AL EAST", "American League")
BOS = Team.new("BOS", "Boston Red Sox", "AL EAST", "American League")
NYY = Team.new("NYY", "New York Yankees", "AL EAST", "American League")
TB = Team.new("TB", "Tampa Bay Rays", "AL EAST", "American League")
TOR = Team.new("TOR", "Toronto Blue Jays", "AL EAST", "American League")

#AL_CENTRAL = ["CWS", "CLE", "DET", "KC", "MIN"]
CWS = Team.new("CWS", "Chicago White Sox", "AL CENTRAL", "American League")
CLE = Team.new("CLE", "Cleveland Guardians", "AL CENTRAL", "American League")
DET = Team.new("DET", "Detroit Tigers", "AL CENTRAL", "Americae")   
MIN = Team.new("MIN", "Minnesota Twins", "AL CENTRAL", "American League")

#AL_WEST = ["HOU", "LAA", "OAK", "SEA", "TEX"]
HOU = Team.new("HOU", "Houston Astros", "AL WEST", "American League")
LAA = Team.new("LAA", "Los Angeles Angels", "AL WEST", "American League")
OAK = Team.new("OAK", "Oakland Athletics", "AL WEST", "American League")
SEA = Team.new("SEA", "Seattle Mariners", "AL WEST", "American League")
TEX = Team.new("TEX", "Texas Rangers", "AL WEST", "American League")

#NL_EAST = ["ATL", "MIA", "NYM", "PHI", "WSH"]
ATL = Team.new("ATL", "Atlanta Braves", "NL EAST", "National League")
MIA = Team.new("MIA", "Miami Marlins", "NL EAST", "National League")
NYM = Team.new("NYM", "New York Mets", "NL EAST", "National League")
PHI = Team.new("PHI", "Philadelphia Phillies", "NL EAST", "National League")
WSH = Team.new("WSH", "Washington Nationals", "NL EAST", "National League")

#NL_CENTRAL = ["CHC", "CIN", "MIL", "PIT", "STL"]
CHC = Team.new("CHC", "Chicago Cubs", "NL CENTRAL", "National League")
CIN = Team.new("CIN", "Cincinnati Reds", "NL CENTRAL", "National League")
MIL = Team.new("MIL", "Milwaukee Brewers", "NL CENTRAL", "National League")
PIT = Team.new("PIT", "Pittsburgh Pirates", "NL CENTRAL", "National League")
STL = Team.new("STL", "St. Louis Cardinals", "NL CENTRAL", "National League")

#NL_WEST = ["ARI", "COL", "LAD", "SD", "SF"]
ARI = Team.new("ARI", "Arizona Diamondbacks", "NL WEST", "National League")
COL = Team.new("COL", "Colorado Rockies", "NL WEST", "National League")
LAD = Team.new("LAD", "Los Angeles Dodgers", "NL WEST", "National League")
SD = Team.new("SD", "San Diego Padres", "NL WEST", "National League")
SF = Team.new("SF", "San Francisco Giants", "NL WEST", "National League")

