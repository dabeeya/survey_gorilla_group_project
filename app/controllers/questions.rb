post '/questions/new' do
  p params
  # @questions = @survey.questions
  @new_question = Question.create(survey_id: Survey.last.id,
                                 context: params[:context],
                                 style: params[:style])
  choice = Choice.create(input: params[:input])
  @new_question.choices << choice
  erb :'partials/_submitted', layout: false
  return @new_question.to_json
end
