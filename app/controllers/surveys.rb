get '/surveys/new' do
  erb :create
end

post '/surveys/submit' do
	puts params
	params.each do |question, input|
		choices = Choice.where(question_id: question, input: input)
		if choices.empty?
			choices << Choice.create(input: input, question_id: question.to_s)
		end
		Response.create(choice_id: choices.first.id, user_id: current_user.id)
	end
	redirect "users/#{current_user.id}"

	end

get '/surveys/:id' do
	@survey = Survey.find(params[:id])
	@num = 0
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


