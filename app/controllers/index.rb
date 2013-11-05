get '/' do
  @notes = Note.all
  erb :index
end

post '/' do
  # @notes = Note.all
  Note.create!(params)
  erb :index
end

get '/:id' do
  @note = Note.find(params[:id])
  erb :note_contents
end

get '/:id/edit' do
  @note = Note.find(params[:id])
  @title = "Edit note ##{params[:id]}"
  erb :edit_note
end

put '/:id' do
  @note = Note.find(params[:id])
  @note.content = params[:content]
  @note.save
  redirect '/'
end

get '/:id/delete' do
  @note = Note.find(params[:id])
  @title = "Confirm delete of note ##{params[:id]}"
  erb :delete
end

delete '/:id/delete' do
  @note = Note.find(params[:id])
  @note.destroy
  redirect '/'
end
