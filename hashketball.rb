require 'pry'
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

#num_points_scored returns points scored for each player
#takes in an argument of a player's name and
#returns the number of points scored for that player.
def get_players
  players = game_hash.keys.map do |team|
    game_hash[team][:players]
  end
  players.flatten
end

def num_points_scored(player_name)
  #Iterate through top level
  #game_hash.each do |location, team_data| #home and away teams
  #get all players
    found_player = get_players.find do |player|
      player[:player_name] == player_name
    end
  found_player[:points]
end


def shoe_size(player_name)
#takes in an argument of a player's name and returns the shoe size for that player
  found_player = get_players.find do |player|
    #if player's name is equal to player_name
    player[:player_name] == player_name
  end
  #return the shoe size
  found_player[:shoe]
end



def team_names
#operates on the game Hash to return an Array of the team names.
  game_hash.map do |team, team_info|
    team_info[:team_name]
  end

end

def team_colors(team_input)
#takes in an argument of the team name and returns an Array of that team's colors.
  if team_input.downcase == "charlotte hornets"
    return game_hash[:away][:colors]
  else return game_hash[:home][:colors]
  end
end

def player_numbers(team_name)
#takes in an argument of a team name and returns an Array of the jersey numbers for that team.
  output = []
  game_hash.each do |team, team_info|
    if team_info[:team_name] == team_name
      team_info.each do |key, value|
        if key == :players
          value.each do |player|
            output.push(player[:number])
        end
      end
    return output
  end
end

def player_stats(player_name)
#returns all stats for a given player
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player.has_value?(player_name)
         return player
      end
    end
  end
end

def big_shoe_rebounds
  #returns the number of rebounds of the player with the biggest shoe size
  big_shoe = 0
  rebounds = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end
