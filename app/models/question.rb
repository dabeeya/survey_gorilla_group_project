class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey
  has_many :responses, through: :choices

  def update_output
  	output = Hash.new
  	output[:id] = id
  	output[:style] = style
  	output[:context] = context
  	output[:choices] = []
  	choices.each do |choice|
  		output[:choices] << choice.input
  	end
  	output.to_json
  end 
end
