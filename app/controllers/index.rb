get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  Note.create!(params)
  erb :index
end

get '/:id' do
  erb :edit_note
end
