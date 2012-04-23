require 'rubygems'
require 'sinatra'
require 'twitter'
require 'mongo_mapper'

get '/' do
  Twitter.user_timeline("ryangraves").first.text
end
