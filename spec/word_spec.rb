require('rspec')
require('word')

describe '#Word' do
  describe('#save') do
    it("saves a word") do
      word = Word.new("Joyful", nil)
      word.save()
      word2 = Word.new("Gloomy", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Joyful", nil)
      word.save()
      word2 = Word.new("Gloomy", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("Gloomy", nil)
      word2 = Word.new("Gloomy", nil)
      expect(word).to(eq(word2))
    end
  end

end