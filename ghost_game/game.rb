require_relative 'player'

class Game
  ALPHABET = Set.new('a'..'z')
  
  attr_accessor :fragment
  
  def initialize(*players)
    words = File.readlines('dictionary.txt').map(&:chomp)
    @fragment = ''
    @players = players
    @dictionary = Set.new(words)
  end
  
  def play_round
    
  end
  
  def previous_player
    @players.last
  end
  
  def current_player
    @players.first
  end
  
  def next_player!
    @players.rotate!
  end
  
  def get_prompt
    gets.chomp
  end
  
  def take_turn(player)
    system('clear')
    puts "It's #{current_player}'s turn, please enter a character"
    get_prompt until valid_play?(get_prompt)
    prompt = gets.chomp
    @fragment += prompt
  end
  
  def valid_play?(string)
    if string.length == 1 && ALPHABET.include?(string)
      return true
    else
      puts "Please enter valid character"
      return false
    end
  end
  
end
