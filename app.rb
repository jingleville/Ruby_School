require 'sinatra'

# from server
get '/' do 
  erb :index
end

# to server
post '/' do
  @login = params[:aaa]
  @password = params[:bbb]

  p @login
  p @password

  if @login == 'admin' && @password == 'secret'
    erb :welcome
  else
    erb :index
  end
end
