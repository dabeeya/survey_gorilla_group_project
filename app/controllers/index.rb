get '/' do
	if logged_in?
		@surveys = Survey.all
		erb :profile
	else
  # Look in app/views/index.erb
  	erb :index
  end
end
