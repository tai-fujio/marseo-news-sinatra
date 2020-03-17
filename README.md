## Welcome to Marseo News

This is a partial clone of Hacker News (https://news.ycombinator.com/), created using Ruby, ActiveRecord and Sinatra during my third week of Le Wagon coding bootcamp.

![](marseo-news-scrolling.gif)

To run it locally, clone the folder, type "ruby app.rb" in the Terminal and then go to "http://localhost:4567/" in your browser.

To reset the DB with the latest 10 news from Hacker News, run "rake db:drop db:create db:migrate db:seed"

All the buttons that you find are functioning, but I wrote the CSS only for the homepage, so the rest of the routes are just plain HTML.
