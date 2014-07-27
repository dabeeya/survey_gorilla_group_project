class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey
  has_many :responses, through: :choices

end
