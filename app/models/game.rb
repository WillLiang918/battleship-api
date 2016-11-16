class Game < ApplicationRecord
  has_one :board
  has_many :cells, -> { order(:id) }, through: :board

  after_create :create_board

  def create_board
    Board.create(game_id: id)
  end

  def remaining_player_ships
    board.ships.where(computer_ship: false, sunk: false).count
  end

  def remaining_computer_ships
    board.ships.where(computer_ship: true, sunk: false).count
  end

  def game_over
    board.all_player_ship_sunk? || board.all_computer_ship_sunk?
  end
end
