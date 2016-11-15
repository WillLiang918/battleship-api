class Cell < ApplicationRecord
  belongs_to :board
  has_one :ship

  def has_player_ship
    ship.present? && !ship.computer_ship
  end

  def has_computer_ship
    ship.present? && ship.computer_ship
  end

  def check
    self.update_attribute(:checked, true)
    if self.available?
      return 'Miss...'
    elsif ship && ship.computer_ship
      ship.update_attribute(:sunk, true)
      return 'Hit!'
    else
      return 'Invalid guess'
    end
  end

  def check_for_computer
    self.update_attribute(:checked, true)
    if self.available?
      return 'Miss!'
    elsif ship && ship.computer_ship == false
      ship.update_attribute(:sunk, true)
      return 'Hit...'
    else
      return 'Invalid Guess, WTF?'
    end
  end
end
