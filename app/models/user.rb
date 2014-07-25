class User < ActiveRecord::Base
  has_many :surveys
  has_many :voted_surveys, through: :results source: :surveys
end
