get '/surveys/new' do
  erb :create
end

get '/surveys/:id' do
	erb :survey
end

#Maker Edit Page
get '/surveys/:id/maker' do
	@survey = Survey.find(params[:id])
	@questions = @survey.questions
	erb :edit_survey
end

#Posts when particular edit or delete button is clicked
post 'surveys/:id/maker' do
	if request.xhr?
    	content_type :json
    	{visibility: visibility}.to_json
  end
end







patch '/surveys/:id/edit' do
end

get '/surveys/:id/results' do

end


