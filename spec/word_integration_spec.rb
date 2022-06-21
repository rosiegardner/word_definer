require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a words path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word!')
    fill_in('word_name', :with => 'Submarine')
    click_on('Go!')
    expect(page).to have_content('Submarine')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new("Submarine", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('define_word', :with => 'A warship with a streamlined hull designed to operate completely submerged in the sea for long periods, equipped with a periscope and typically armed with torpedoes or missiles.')
    click_on('Add definition!')
    expect(page).to have_content('A warship with a streamlined hull designed to operate completely submerged in the sea for long periods, equipped with a periscope and typically armed with torpedoes or missiles.')
  end
end

describe('edit a word', {:type => :feature}) do
  it("edits a word and returns to word page") do
    word = Word.new("Submarine", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Edit word")
    fill_in("Update word", :with => "Spaceship")
    click_on("Update!")
    expect(page).to have_content("Spaceship")
  end
end

describe('edit a definition', {:type => :feature}) do
  it("edits a words definition and returns to word page") do
    word = Word.new("Spaceship", nil)
    word.save()
    definition = Define.new("a spacecraft, especially one controlled by a crew.", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definition/#{definition.id}")
    fill_in("Edit definition", :with => "Alien transportation")
    click_on("Update definition")
    expect(page).to have_content("Alien transportation")
  end
end

describe('delete a word', {:type => :feature}) do
  it("deletes a word and returns to word page") do
    word = Word.new("Spaceship", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Edit word")
    click_on("Delete!")
    expect(page).to have_content("")
  end
end

describe("deletes a definition", { :type => :feature }) do
  it("delete a definition and return to word page") do
    word = Word.new("Spaceship", nil)
    word.save()
    definition = Define.new("Alien transportation", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definition/#{definition.id}")
    click_on("Delete definition")
    expect(page).to have_content("")
  end
end