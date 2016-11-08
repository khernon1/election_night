class Candidate < ApplicationRecord

attr_accessor :clinton, :trump 


  def twitter
    @clinton = 0
    @trump = 0

    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "LES5s471PLLuaUkjMqCl2SX2m"
      config.consumer_secret     = "nJILi7pHqUhVmHh5dt9DwvLV4yOVYQa82w5Xpb4P60URJAXoSl"
      config.access_token        = "81697530-ifI24FyEatCOaESTZYvW1MidVuTPeKpUIjPCi3Mtp"
      config.access_token_secret = "HwfkWXWIHSpa2UEaH4u1qRue67VNdu3EE1dAJeCIlbXhB"      
    end
    topics = ["trump", "clinton"]
    before = Time.now  
    client.filter(track: topics.join(",")) do |tweet|
      if 5 < (Time.now - before)
        persist_total
        break 
      end
      
        if tweet.text.downcase.include?("clinton")
          @clinton += 1
          # puts "Clinton: #{@clinton}"
        elsif tweet.text.downcase.include?("trump")
          @trump += 1
          # puts "Trump: #{@trump}"
        # count += 1 if tweet.is_a?(Twitter::Tweet)      
        end

    end      
  end

  # add total to db
  def persist_total
    clinton = Candidate.find_by(name: 'Clinton')
    clinton.total += @clinton
    clinton.save

    trump = Candidate.find_by(name: 'Trump')
    trump.total += @trump
    trump.save

    seconds = Candidate.find_by(name: 'Seconds Ran')
    seconds.total += 5
    seconds.save
  end

end
