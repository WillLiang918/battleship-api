json.leaderboard @games do |game|
  json.time game.win_time
  json.initials game.initials
end