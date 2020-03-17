require "json"
require "rest-client"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
dirty_repo = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
repository = JSON.parse(dirty_repo)

repository.first(10).each do |number|
  dirty_post_info = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{number}.json"
  post_info = JSON.parse(dirty_post_info)
  username = post_info["by"]
  user= User.new(username: username, email: username << "@gmail.com")
  post = Post.new(
    name: post_info["title"],
    url: post_info["url"],
    votes: post_info["score"],
    user: user
  )
  post.save!
  user.save!
end
