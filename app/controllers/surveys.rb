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

patch '/surveys/:id/edit' do
end

get '/surveys/:id/results' do

erb :survey_results
end


