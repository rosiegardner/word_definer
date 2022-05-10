require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a words path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    save_and_open_page
    click_on('Add a New Word!')
    fill_in('word_name', :with => 'Submarine')
    click_on('Go!')
    expect(page).to have_content('Submarine')
  end
end