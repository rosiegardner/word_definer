class Define
  attr_reader :id
  attr_accessor :word_content, :words_id

  @@words_defined = {}
  @@total_rows = 0

  def initialize(word_content, words_id, id)
    @word_content = word_content
    @words_id = words_id
    @id = id || @@total_rows += 1
  end

  def ==(definitions_to_compare)
    (self.word_content() == definitions_to_compare.word_content()) && (self.words_id() == definitions_to_compare.words_id())
  end

  def self.all
    @@words_defined.values
  end

  def save
    @@words_defined[self.id] = Define.new(self.word_content, self.words_id, self.id)
  end

  def word
    Word.find(self.words_id)
  end

  def self.find(id)
    @@words_defined[id]
  end

  def self.find_by_word(wrd_id)
    definitions = []
    @@words_defined.values.each do |defined|
      if defined.words_id == wrd_id
        definitions.push(defined)
      end
    end
    definitions
  end

  def update(word_content, words_id)
    self.word_content = word_content
    self.words_id = words_id
    @@words_defined[self.id] = Define.new(self.word_content, self.words_id, self.id)
  end

  def delete
    @@words_defined.delete(self.id)
  end

  def self.clear
    @@words_defined = {}
  end
end
