require 'rspec'
require 'define'
require 'word'
require 'pry'

describe '#Define' do

  before(:each) do
    Word.clear()
    Define.clear()
    @words = Word.new("Gloomy", nil)
    @words.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definiton") do
      defined = Define.new("Dark or poorly lit, especially so as to appear frightening.", @words.id, nil)
      defined2 = Define.new("Dark or poorly lit, especially so as to appear frightening.", @words.id, nil)
      expect(defined).to(eq(defined2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      defined = Define.new("Gloomy", @words.id, nil)
      defined.save()
      defined2 = Define.new("Dark or poorly lit, especially so as to appear frightening", @words.id, nil)
      defined2.save()
      expect(Define.all).to(eq([defined, defined2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      defined = Define.new("Gloomy", @words.id, nil)
      defined.save()
      defined2 = Define.new("Dark or poorly lit, especially so as to appear frightening", @words.id, nil)
      Define.clear()
      expect(Define.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      defined = Define.new("Dark or poorly lit, especially so as to appear frightening", @words.id, nil)
      defined.save()
      expect(Define.all).to(eq([defined]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      defined= Define.new("Dark or poorly lit, especially so as to appear frightening", @words.id, nil)
      defined.save()
      defined2 = Define.new("A rainy and grey atmosphere", @words.id, nil)
      defined2.save()
      expect(Define.find(defined.id)).to(eq(defined))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Word.new("Gloomy", nil)
      word2.save
      defined = Define.new("Dark or poorly lit, especially so as to appear frightening", @words.id, nil)
      defined.save()
      defined2 = Define.new("A rainy and grey atmosphere", word2.id, nil)
      defined2.save()
      expect(Define.find_by_definition(word2.id)).to(eq([defined2]))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      defined = Define.new("A rainy and grey atmosphere", @words.id, nil)
      defined.save()
      defined.update("having a frowning or scowling appearance", @words.id)
      expect(defined.name).to(eq("having a frowning or scowling appearance"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      defined = Define.new("Dark or poorly lit, especially so as to appear frightening", @words.id, nil)
      defined.save()
      defined2 = Define.new("A rainy and grey atmosphere.", @words.id, nil)
      defined2.save()
      defined.delete()
      expect(Define.all).to(eq([defined2]))
    end
  end
end