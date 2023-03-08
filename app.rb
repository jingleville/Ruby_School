require 'sinatra'

# from server
get '/' do 
  erb :index
end

# to server
post '/' do
  @user_name = params[:user_name]
  @phone     = params[:phone]
  @date_time = params[:date_time]

  @title = 'Thank you!'
  @message = "Dear #{@user_name}, we'll wait gor you at #{@date_time}"

  f = File.open 'users.txt', 'a' 
  f.write "User #{@user_name}, phone #{@phone}, date is #{@date_time}"
  f.close

  erb :welcome
end

get '/admin' do
  if @login != 'admin'
    return erb :login
  end

  if @password != 'secret'
    return erb :login
  end

  erb :admin
end

post '/admin' do
  @login = params[:login]
  @password = params[:password]

  if @login != 'admin'
    return erb :login
  end

  if @password != 'secret'
    return erb :login
  end

  @users_list = File.read 'users.txt'
  erb :admin
end

#almost finished lesson20