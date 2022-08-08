require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ("A".."Z").to_a.shuffle.first(10)
  end

  def score
    @words = params[:word].upcase
    @letters = params[:letters]
  end

  def english_word(words)
    url = "https://wagon-dictionary.herokuapp.com/#{words}"
    user_serialized = URI.open(url).read
    result = JSON.parse(user_serialized)
    result[:found]
  end
end
