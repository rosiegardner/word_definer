require 'rspec'
require 'define'
require 'word'
require 'pry'

describe '#Define' do

  before(:each) do
    Word.clear()
    Define.clear()
    @words = Word.new("Atmosphere", nil)
    @words.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      defined = Define.new("The gases surrounding Earth", @words.id, nil)
      defined2 = Define.new("The gases surrounding Earth", @words.id, nil)
      expect(defined).to(eq(defined2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      defined = Define.new("The mood of a Situation", @words.id, nil)
      defined.save()
      defined2 = Define.new("The gases surrounding Earth", @words.id, nil)
      defined2.save()
      expect(Define.all).to(eq([defined, defined2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      defined = Define.new("The mood of a Situation", @words.id, nil)
      defined.save()
      defined2 = Define.new("The gases surrounding Earth", @words.id, nil)
      defined2.save()
      Define.clear()
      expect(Define.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      defined = Define.new("The mood of a Situation", @words.id, nil)
      defined.save()
      expect(Define.all).to(eq([defined]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      defined = Define.new("The mood of a Situation", @words.id, nil)
      defined.save()
      defined2 = Define.new("The gases surrounding Earth", @words.id, nil)
      defined2.save()
      expect(Define.find(defined.id)).to(eq(defined))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Define.new("Climate", nil)
      word2.save
      defined = Define.new("The mood of a Situation", @words.id, nil)
      defined.save()
      defined2 = Define.new("The gases surrounding Earth", word2.id, nil)
      defined2.save()
      expect(Define.find_by_word(word2.id)).to(eq([defined2]))
    end
  end

  describe('#word') do
    it('finds the word a definition belongs to') do
      defined = Define.new('"The mood of a Situation', @words.id, nil)
      defined.save()
      expect(defined.word()).to(eq(@words))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      defined = Define.new("The mood of a Situation", @words.id, nil)
      defined.save()
      defined.update("The air in any particular place", @words.id)
      expect(defined.word_content).to(eq("The air in any particular place"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      defined = Define.new("The mood of a Situation", @words.id, nil)
      defined.save()
      defined2 = Define.new("The gases surrounding Earth", @words.id, nil)
      defined2.save()
      defined.delete()
      expect(Define.all).to(eq([defined2]))
    end
  end
end