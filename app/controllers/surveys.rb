get '/surveys/new' do
  if logged_in?
    erb :'survey/survey_name'
  else
    redirect '/'
  end
end

post '/surveys/new' do
  open = false
  open = true if params[open] == "true" 

  @survey = Survey.create(title:params[:name], user_id: session[:user_id], open: open)
  erb :create_survey
end

post '/surveys/submit' do
	puts params
	params.each do |question, input|
		choices = Choice.where(question_id: question, input: input)
		if choices.empty?
			choices << Choice.create(input: input, question_id: question.to_s)
		end
		Response.create(choice_id: choices.first.id, user_id: poll_taker)
	end
	redirect "/"

	end

get '/surveys/results' do
  if logged_in?
    user = User.find(session[:user_id])
    @surveys = user.surveys 
    erb :survey_all_results
  else
    redirect '/'
  end
end

get '/surveys/:id' do
	@survey = Survey.find(params[:id])
  redirect '/' if current_user.nil? && !@survey.open
	@increment = Increment.new
	erb :survey
end

delete '/surveys/:id' do
  p "*" * 50
  p params
  if logged_in?
    # Survey.delete(params[:id])
  else
    redirect '/'
  end
end

post '/surveys/:id/questions' do
  p "*" * 40
  puts params
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  @new_question = Question.create(survey_id: @survey.id, context: params[:context], style: params[:style])
  returned_choices = params[:selection]
  p "*" * 40
  p returned_choices[:input]
  if returned_choices[:input] != "" || nil
    returned_choices.each do |option|
      choice = Choice.create(input: option[1])
      @new_question.choices << choice
    end
  end
  erb :'partials/_submitted', layout: false
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
  if logged_in?
    @survey = Survey.find(params[:id])
    @responses = @survey.compile_responses
    @increment = Increment.new
    erb :survey_results
  else
    redirect '/'
  end
end
