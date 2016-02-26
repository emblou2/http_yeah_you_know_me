require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_updating_guess_calculatues_too_low
    game = Game.new
    new_guess = 3
    game_answer = game.update_guess(new_guess)

    assert_equal "<pre>There have been 1 guesses. 3 is too low.</pre>", game_answer
  end

  def test_updating_guess_calculatues_correct
    game = Game.new
    new_guess = 7
    game_answer = game.update_guess(new_guess)

    assert_equal "<pre>There have been 1 guesses. 7 is correct.</pre>", game_answer
  end

  def test_updating_guess_calculatues_too_high
    game = Game.new
    new_guess = 9
    game_answer = game.update_guess(new_guess)

    assert_equal "<pre>There have been 1 guesses. 9 is too high.</pre>", game_answer
  end



end
