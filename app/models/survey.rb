class Survey < ActiveRecord::Base
  has_many :questions
  belongs_to :user
  has_many :choices, through: :questions 
  has_many :responses, through: :choices

  def compile_responses 
  	results = Hash.new(0)
  	questions.each do |question|
  		results[question.context] = Hash.new(0)
  		results[question.context][:style] = question.style
  		question.choices.each do |choice|
  			selections = responses.where(choice_id: choice.id).size
  			results[question.context][choice.input] = selections
  		end
  		puts results 
  	end 
  end
end
