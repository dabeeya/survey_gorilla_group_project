get '/question/:id/edit' do
	@question = Question.find(params[:id])
	puts @question.update_output
	return @question.update_output
end