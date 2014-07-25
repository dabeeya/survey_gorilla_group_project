get '/' do
  # Look in app/views/index.erb
  erb :index
end


#----------- SESSIONS -----------

# get '/sessions/new' do    #KEEPING THIS JUST IN CASE WE DECIDE TO HAVE A SIGN IN PAGE
#   # render sign-in page
#   @email = nil
#   erb :index
# end

post '/sessions' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :index
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end

get '/logout' do
  session.clear
  redirect '/'
end
