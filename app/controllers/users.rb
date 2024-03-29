after do
  ActiveRecord::Base.connection.close
end

get '/' do

@public_surveys = Survey.where(open: true)
  
  if logged_in?
    @user = User.find(session[:user_id])
    @surveys = @user.surveys
    erb :index
  else
    erb :index
  end

end

#LOGOUT
get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do #
	@user = User.find(params[:id])
	@surveys = @user.surveys
  # @survey_id_ary = []
  # @surveys.each do |x|
  #   @survey_id_ary << x.id
  # end
  # @survey_id_ary
  erb :profile
end

#----------- SESSIONS -----------

#SIGN-IN
post '/users' do
  # sign-in
  # @email = params[:email]
  user = User.authenticate(params[:email], params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :index
  end
end


#SIGN-UP
post '/users/new' do
  @user = User.create(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :index
  end
end
