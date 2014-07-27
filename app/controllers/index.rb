get '/' do
  # Look in app/views/index.erb
  @surveys = Survey.all
  erb :index
end
