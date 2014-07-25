get '/users/:id' do
  erb :profile 
end


#----------- SESSIONS -----------

#SIGN-IN
post '/users' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/users/#{user.id}'
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
    redirect '/users/#{user.id}'  
  else
    erb :index
end


#LOGOUT
get '/users/logout' do 
  session.clear
  redirect '/'
end


