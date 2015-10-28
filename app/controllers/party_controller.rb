require 'scripts/game_methods'

class PartyController < ApplicationController

  def game
    @grid = generate_grid(9).join
  end

  def score
    @word        = params[:word]
    @grid        = params[:grid]
    @result      = in_grid?(@word,@grid)
    @start_time  = Time.parse(params[:start_time])
    @translation = find_on_wordreference(@word)
    @end_time    = Time.now
    @time        = @end_time - @start_time
  end
end



