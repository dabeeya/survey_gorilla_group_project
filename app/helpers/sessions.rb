helpers do
  
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def poll_taker
  	if logged_in? 
  		current_user.id
  	else 
  		Anonymous.new.id
  	end
  end

end