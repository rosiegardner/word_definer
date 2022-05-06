require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
  # "This will be our home page. '/' is always the root route in a Sinatra application."
end

get('/words') do
  @words = Word.all
  erb(:words)
  # "This route will show a list of all words."
end

get('/words/new') do
  erb(:new_word)
  # "This will take us to a page with a form for adding a new words."
end

get('/words/:id') do
  # "This route will show a specific word based on its ID. The value of ID here is #{params[:id]}."
end

post('/words') do
  # "This route will add a word to our list of wordss. We can't access this by typing in the URL. In a future lesson, we will use a form that specifies a POST action to reach this route."
end

get('/words/:id/edit') do
  # "This will take us to a page with a form for updating a word with an ID of #{params[:id]}."
end

patch('/wordss/:id') do
  # "This route will update a word. We can't reach it with a URL. In a future lesson, we will use a form that specifies a PATCH action to reach this route."
end

delete('/words/:id') do
  # "This route will delete an word. We can't reach it with a URL. In a future lesson, we will use a delete button that specifies a DELETE action to reach this route."
end

get('/custom_route') do
  # "We can even create custom routes, but we should only do this when needed."
end
