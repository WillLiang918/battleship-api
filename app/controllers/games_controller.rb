class GamesController < ApplicationController
  def create
    @game = Game.create
  end

  def show
    @game = Game.find(params[:id])
  end

  def strike
    @game = Game.find(params[:id])
    unless @game.game_over
      x, y         = params[:position_x], params[:position_y]
      @players_log = @game.board.check_guess(x, y)

      if @game.game_over
        @game.update_attribute(:win_time, Time.now - @game.start_time)
        @result = 'Win'
        return
      end

      @computers_log = @game.board.computer_guess
      if @game.game_over
        @result = 'Lost' and return
      end
    end
  end

  def place_ship
    @game   = Game.find(params[:id])
    x, y    = params[:position_x], params[:position_y]
    @result = @game.board.place_user_ship(x, y)
  end

  def submit_initials
    @game = Game.find(params[:id])
    @game.update_attribute(:initials, params[:initials])
    render json: { message: 'Success!' }
  end

  def leaderboard
    @games = Game.where('win_time is NOT Null').order(:win_time).first(10)
  end
end
