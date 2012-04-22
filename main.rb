require 'rubygems'
require 'sinatra'
require 'twitter'

get '/' do
  Twitter.user_timeline("ryangraves").first.text
end

Twitter.search("@uber", :rpp => 3, :result_type => "recent").map do |status|
  "#{status.from_user}: #{status.text}"
end