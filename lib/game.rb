require 'pry'

class Game

  attr_reader :num_guesses, :last_guess

  def initialize
    @answer = 7
    @num_guesses = 0
    @last_guess = ""
  end

  def update_guess(guess)
    @num_guesses += 1
    @last_guess = guess

    if @last_guess == @answer
      "<pre>There have been #{@num_guesses} guesses. #{@last_guess} is correct.</pre>"
    elsif @last_guess < @answer
      "<pre>There have been #{@num_guesses} guesses. #{@last_guess} is too low.</pre>"
    else
      "<pre>There have been #{@num_guesses} guesses. #{@last_guess} is too high.</pre>"
    end

  end
end
