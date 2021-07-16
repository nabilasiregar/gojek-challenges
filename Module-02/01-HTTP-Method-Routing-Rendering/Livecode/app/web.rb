require 'sinatra'
require 'sinatra/reloader'

get '/hello' do
  'Hello world!'
end

get '/message/:name' do
  name = params[:name]
  color = params[:color] ? params[:color] : 'Pink'
  erb :message, :locals => {
    :color => color,
    :name => name
  }
end

get '/login' do
  erb :login
end

post '/login' do
  if params[:name] == params[:name] and params[:username] == params[:username]
    return 'Your name has been submitted!'
  else
    redirect '/login'
  end
end

tasks = ['Practice Leetcode', 'Finish Angular course on udemy']

get '/tasks' do
  erb :tasks, :locals => {
    :tasks => tasks
  }
end

post '/tasks' do
  if not params[:task].nil?
    tasks << params[:task]
  end
  redirect '/tasks'
end

post '/delete' do
  if not params[:task].nil?
    tasks.delete_at(params[:task].to_i - 1)
  end
  redirect '/tasks'
end



