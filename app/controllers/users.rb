post '/users' do #sign-in 
	
end

post '/users/new' do #sign-up
end

get '/users/logout' do 
end

get '/users/:id' do #
	@user = User.find(params[:id])
	@surveys = @user.surveys
  erb :profile 
end
