require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

require_relative "config/application"

set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

enable :sessions



get '/' do
  @posts = Post.all.order(votes: :desc)
  erb :posts
end

get '/add_post' do
  erb :add_post
end

post '/post' do
  user = User.where(username: params["username"]).first
  user = User.new(username: params["username"], email: params["email"]) unless user.valid?
  @post = Post.new(name: params["name"], user: user, url: params["url"])
  @post.save
  redirect '/'
end

post '/upvote_post:id' do
  post = Post.where(id: params["id"]).first
  post.votes += 1
  post.save
  redirect '/'
end

post '/delete_confirmation:id' do
  @post = Post.where(id: params["id"]).first
  erb :delete_confirmation
end

post '/delete_post:id' do
  post = Post.where(id: params["id"]).first
  post.destroy
  redirect '/'
end

post '/update_information:id' do
  @post = Post.where(id: params["id"]).first
  erb :update_information
end

post '/update_post:id' do
  @post = Post.where(id: params["id"]).first
  @post.name = params["name"] unless params["name"] == ""
  @post.url = params["url"] unless params["url"] == ""
  @post.save
  redirect '/'
end

# TODO: add more routes to your app!
