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
	erb :survey
end

post '/surveys/:id/questions' do
  p "******************"
  p params
  # @questions = @survey.questions
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
  #return @new_question.to_json
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

