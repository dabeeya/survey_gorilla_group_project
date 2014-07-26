get '/surveys/new' do
  erb :survey_name
end

post '/surveys/new' do
  erb :create
end

get '/surveys/:id' do
	erb :survey
end

#Maker Edit Page
get '/surveys/:id/maker' do
	@survey = Survey.find(params[:id])

	erb :edit_survey
end

patch '/surveys/:id/edit' do
end

get '/surveys/:id/results' do
end
