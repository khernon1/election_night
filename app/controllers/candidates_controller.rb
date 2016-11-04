class CandidatesController < ApplicationController

  def index
    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "LES5s471PLLuaUkjMqCl2SX2m"
      config.consumer_secret     = "nJILi7pHqUhVmHh5dt9DwvLV4yOVYQa82w5Xpb4P60URJAXoSl"
      config.access_token        = "81697530-ifI24FyEatCOaESTZYvW1MidVuTPeKpUIjPCi3Mtp"
      config.access_token_secret = "HwfkWXWIHSpa2UEaH4u1qRue67VNdu3EE1dAJeCIlbXhB"      
    end
    count = 0
    topics = ["trump", "clinton"]
      client.filter(track: topics.join(",")) do |tweet|
        byebug
        # Candidate.create(name: tweet.text)
        count += 1 if tweet.is_a?(Twitter::Tweet)
        puts count 
      end
  end

end
