class Board < ApplicationRecord
  ROW = 5
  COL = 5
  SHIP_COUNT = 10

  belongs_to :game
  has_many :cells
  has_many :ships, through: :cells

  after_create :create_grid

  def create_grid
    ROW.times do |row_idx|
      COL.times do |col_idx|
        Cell.create(board_id: id, position_x: row_idx, position_y: col_idx)
      end
    end
  end

  def place_user_ship(x, y)
    cell = cells.where(position_x: x, position_y: y).first

    if cell.available? && user_ship_count < SHIP_COUNT
      place_ship(cell)
      place_computer_ships if user_ship_count == SHIP_COUNT
      response = 'Placed'
    else
      response = 'Invalid input'
    end

    response
  end

  def place_computer_ships
    available_cells = cells.where(available: true).sample(SHIP_COUNT)
    available_cells.each do |cell|
      place_ship(cell, {computer_ship: true})
    end
    game.update_attribute(:start_time, Time.now)
  end

  def place_ship(cell, computer_ship=false)
    cell.update_attribute(:available, false)
    Ship.create(cell_id: cell.id, computer_ship: computer_ship)
  end

  def check_guess(x, y)
    cell = cells.where(position_x: x, position_y: y).first
    if cell.checked?
      'invalid guess, already checked'
    elsif cell.has_player_ship
      'This is your ship!'
    else
      cell.check
    end
  end

  def computer_guess
    computer_guess = cells.where(checked: false).sample(1).first

    until computer_guess.ship.nil? || computer_guess.has_player_ship
      computer_guess = cells.where(checked: false).sample(1).first
    end

    computer_guess.check_for_computer
  end

  def user_ship_count
    ships.where(computer_ship: false).count
  end

  def all_player_ship_sunk?
    ships.where(computer_ship: false).all?(&:sunk)
  end

  def all_computer_ship_sunk?
    ships.where(computer_ship: true).all?(&:sunk)
  end
end
