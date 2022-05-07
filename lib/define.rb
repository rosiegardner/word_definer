class Define
  attr_reader :id
  attr_accessor :name, :words_id

  @@words_defined = {}
  @@total_rows = 0

  def initialize(name, words_id, id)
    @name = name
    @words_id = words_id
    @id = id || @@total_rows += 1
  end

  def ==(definitions_to_compare)
    (self.name() == definitions_to_compare.name()) && (self.words_id() == definitions_to_compare.words_id())
  end

  def self.all
    @@words_defined.values
  end

  def save
    @@words_defined[self.id] = Define.new(self.name, self.words_id, self.id)
  end

  def self.find(id)
    @@words_defined[id]
  end

  def self.find_by_definition(def_id)
    definitions = []
    @@words_defined.values.each do |defined|
      if defined.words_id == def_id
        definitions.push(defined)
      end
    end
    definitions
  end

  def update(name, words_id)
    self.name = name
    self.words_id = words_id
    @@words_defined[self.id] = Define.new(self.name, self.words_id, self.id)
  end

  def delete
    @@words_defined.delete(self.id)
  end

  def self.clear
    @@words_defined = {}
  end
end
