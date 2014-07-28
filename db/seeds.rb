# require 'faker'

anonymous = User.create(username: 'anon', email: 'anon@anon.com', password: 'anon')

obama = User.create(username: 'daprez', email: 'obama@whitehouse.com', password: 'cake')
obama.surveys << Survey.create(title: "Presidential Desserts", open: true)
obama.surveys.first.questions << Question.create(context: "What would you like the official ice cream to be?", style: "radio")
["chocolate", "vanilla", "blueberry"].each do |flavor|
	obama.surveys.first.questions.first.choices << Choice.create(input: flavor)
end

obama.surveys.first.questions << Question.create(context: "What would you recommend for foreign dignitaries?", style: "text")


# ## use this test data until we have real seed data
# user1 = User.create(username: 'farheen', email: 'f@email.com', password: 'cake')
# user2 = User.create(username: 'cassie', email: 'c@email.com', password: 'cake')
# user3 = User.create(username: 'dylan', email: 'd@email.com', password: 'cake')

# users = [user1, user2, user3]
# users.each do |user|
# 	5.times do
# 		user.surveys << Survey.create(title: Faker::Lorem.sentence)
# 	end
# end

# survey = Survey.first
# 5.times do
# 	survey.questions << Question.create(context: Faker::Lorem.sentence)
# end

# questions = Question.all

# questions.each do |question|
# 	5.times do
# 		question.choices << Choice.create(input: Faker::Lorem.sentence)
# 	end
# end

#####################################

david = User.create(username: 'dabeeya', email: 'd@gmail.com', password: 'david')
david.surveys << Survey.create(title: "DBC Survey", open: true)
david.surveys.last.questions << Question.create(context: "Who is your favorite instructor at DBC", style: "radio")
["Alex", "Nikola", "Baby Jesus"].each do |teacher|
  david.surveys.last.questions.last.choices << Choice.create(input: teacher)
end

david.surveys.last.questions << Question.create(context: "Give us the reason in why you chose that instructor as the best instructor", style: "text")

david.surveys.last.questions << Question.create(context: "Which cohort deserves to hold the title \"Best Cohort Ever\"", style: "radio")
["Newts", "Noots", "Red-Spotted Newts" "Other...Just kidding. Newts"].each do |cohort|
  david.surveys.last.questions.last.choices << Choice.create(input: cohort)
end

david.surveys.last.questions << Question.create(context: "What do you think is Alex\'s spirit animal?", style: "radio")
["A Newt", "A Dragon", "A Tiger" "A Drunk Alpaca"].each do |animal|
  david.surveys.last.questions.last.choices << Choice.create(input: animal)
end

david.surveys << Survey.create(title: "Gangsta Survey", open: false)
david.surveys.last.questions << Question.create(context: "From 1 - Thug, how gangsta are you?", style: "radio")
["1-4", "5", "6-9", "Thug", "Snapbacks and tattoos"].each do |thug|
  david.surveys.last.questions.last.choices << Choice.create(input: thug)
end

david.surveys.last.questions << Question.create(context: "Where yo hood at", style: "text")



###########
christian = User.create(username: 'cmoon24', email: 'c@gmail.com', password: 'moon')
christian.surveys << Survey.create(title: "Sports", open: true)
christian.surveys.last.questions << Question.create(context: "Among the listed items, which is your favorite sport?", style: "radio")
["Baseball", "Football", "Soccer","Basketball","Volleyball","None of the above"].each do |sport|
  christian.surveys.last.questions.last.choices << Choice.create(input: sport)
end


christian.surveys.last.questions << Question.create(context: "Which sport do you think Alex would excel at? Please give us reasons on why.", style: "text")

christian.surveys.last.questions << Question.create(context: "How many hours a week do you spend playing a sport?", style: "radio")
["<1 hour", "1-3 hours", "4-6 hours","7+ hours"].each do |hour|
  christian.surveys.last.questions.last.choices << Choice.create(input: hour)
end

christian.surveys.last.questions << Question.create(context: "Which sport would you like to see more on TV?", style: "radio")
["Quidditch", "Medieval Jousting", "Fake Football aka Soccer","Roman Gladiator Fights"].each do |hour|
  christian.surveys.last.questions.last.choices << Choice.create(input: hour)
end


