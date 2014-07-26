post '/questions/new' do
  p params
  # @questions = @survey.questions
  @survey = Survey.last
  @questions = @survey.questions
  @new_question = Question.create(survey_id: Survey.last.id,
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
