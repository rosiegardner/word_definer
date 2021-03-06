require('rspec')
require('word')
require('define')

describe '#Word' do
  before(:each) do
    Word.clear()
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("Bow", nil)
      word.save()
      word2 = Word.new("Lead", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Joyful", nil)
      word.save()
      word2 = Word.new("Happy", nil)
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
      word = Word.new("Blue", nil)
      word2 = Word.new("Blue", nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.find') do
    it("find a word by id") do
      word = Word.new("Bow", nil)
      word.save()
      word2 = Word.new("Lead", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new("Joyful", nil)
      word.save()
      word.update("Happy")
      expect(word.name).to(eq("Happy"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("Happy", nil)
      word.save()
      word2 = Word.new("Joyful", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#definition') do
    it("returns a words definition") do
      word = Word.new("Atmosphere", nil)
      word.save()
      defined = Define.new("The gases surrounding Earth", word.id, nil)
      defined2 = Define.new("The mood of a Situation", word.id, nil)
      defined2.save()
      expect(word.definition).to(eq([defined, defined2]))
    end
  end


end