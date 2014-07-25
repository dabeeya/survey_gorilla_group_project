get '/surveys/new' do
  erb :create
end

get '/surveys/:id' do
	erb :survey
end

patch '/surveys/:id/edit' do 
end

get '/surveys/id/results' do 
end





