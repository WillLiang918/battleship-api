json.cells cells do |cell|
  json.merge! cell.attributes
  json.has_player_ship cell.has_player_ship
end