json.result @result
json.remaining_player_ships @game.remaining_player_ships
json.remaining_computer_ships @game.remaining_computer_ships

json.computers_log @computers_log
json.players_log @players_log

json.partial! '/cells', cells: @game.cells
