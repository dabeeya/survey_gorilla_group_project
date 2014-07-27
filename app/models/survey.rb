class Survey < ActiveRecord::Base
  has_many :questions
  belongs_to :user
  has_many :choices, through: :questions 
  has_many :responses, through: :choices

  def compile_responses 
  	results = Hash.new(0)
  	questions.each do |question|
  		results[question.id] = Hash.new(0)
  		results[question.id][:style] = question.style
  		results[question.id][:quest] = question.context
  		results[question.id][:answers] = Hash.new(0)
  		question.choices.each do |choice|
  			selections = responses.where(choice_id: choice.id).size
  			results[question.id][:answers][choice.input] = selections
  		end 
  	end 
  	results
  end
end
