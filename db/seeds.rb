require 'faker'

## use this test data until we have real seed data
user1 = User.create(username: 'farheen', email: 'f@email.com', password: 'cake')
user2 = User.create(username: 'cassie', email: 'c@email.com', password: 'cake')
user3 = User.create(username: 'dylan', email: 'd@email.com', password: 'cake')

users = [user1, user2, user3]
users.each do |user|
	5.times do 
		user.surveys << Survey.create(title: Faker::Lorem.sentence)
	end
end

survey = Survey.first
5.times do
	survey.questions << Question.create(context: Faker::Lorem.sentence)
end








