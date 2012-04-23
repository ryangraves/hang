require 'rubygems'
require 'sinatra'
require 'twitter'

get '/' do
  Twitter.user_timeline("ryangraves").first.text
end
