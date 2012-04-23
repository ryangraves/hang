require 'rubygems'
require 'sinatra'
require 'twitter'
require 'mongo_mapper'
require 'oauth'

get '/' do
  Twitter.user_timeline("ryangraves").first.text
end

# Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
def prepare_access_token(oauth_token, oauth_token_secret)
  consumer = OAuth::Consumer.new("APIKey", "APISecret",
    { :site => "http://api.twitter.com",
      :scheme => :header
    })
  # now create the access token object from passed values
  token_hash = { :oauth_token => oauth_token,
                 :oauth_token_secret => oauth_token_secret
               }
  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
  return access_token
end
 
# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
access_token = prepare_access_token("abcdefg", "hijklmnop")
# use the access token as an agent to get the home timeline
response = access_token.request(:get, "http://api.twitter.com/1/statuses/home_timeline.json")