json.game do
  json.id @game.id
  json.partial! '/cells', cells: @game.cells
end
