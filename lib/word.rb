require('pry')

class Word
  @@words = {}

  def initialize(word)
    @word = word
  end

  def self.all
    @@words.values()
  end
end