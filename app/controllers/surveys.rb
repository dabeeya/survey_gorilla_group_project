get '/surveys/new' do
  if logged_in?
    erb :'survey/survey_name'
  else
    redirect '/'
  end
end

post '/surveys/new' do
  @survey = Survey.create(title:params[:name], user_id: session[:user_id])
  erb :create
end

get '/surveys/:id' do
	@survey = Survey.find(params[:id])
	@num = 0
	erb :survey
end

post '/surveys/:id/questions' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  @new_question = Question.create(survey_id: @survey.id,
                                 context: params[:context],
                                 style: params[:style])
  returned_choices =  params[:selection]
  returned_choices.each do |option|
    choice = Choice.create(input: option[1])
    @new_question.choices << choice
  end
  erb :'partials/_submitted', layout: false
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
