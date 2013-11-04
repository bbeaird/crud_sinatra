get '/' do
  # Look in app/views/index.erb
  @notes = Note.all
  erb :index
end

post '/' do
  Note.create!(params)
  erb :index
end

get '/:id/edit' do
  # p "*"*150
  @note = Note.find(params[:id])
  # p @note
  @title = "Edit note ##{params[:id]}"
  erb :edit_note
end

put '/:id' do
  p '*'*80
  p params
  @note = Note.find(params[:id])
  @note.content = params[:content]
  @note.save
  redirect '/'
end
