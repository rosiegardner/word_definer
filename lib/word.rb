require('pry')

class Word
  attr_reader :id, :name

  @@words = {}
  @@total_rows = 0

  def initialize(word, id)
    @word = word
  end

  def self.all
    @@words.values()
  end

end