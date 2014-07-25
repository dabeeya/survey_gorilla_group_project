get '/surveys/new' do
  erb :create
end


get '/surveys/:id' do
end


#Maker Edit Page
get '/surveys/:id/maker' do

	erb :edit_survey 
end 

patch '/surveys/:id/edit' do 
end

get '/surveys/id/results' do 
end





