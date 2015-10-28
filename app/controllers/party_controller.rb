require 'scripts/game_methods'

class PartyController < ApplicationController
  def game
    @grid = generate_grid(9).join
  end

  def score
    @word = params[:word]
  end
end



