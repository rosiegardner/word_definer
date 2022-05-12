require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a words path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    # save_and_open_page
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
    save_and_open_page
    expect(page).to have_content('A warship with a streamlined hull designed to operate completely submerged in the sea for long periods, equipped with a periscope and typically armed with torpedoes or missiles.')
  end
end