module TweetsHelper
	#processing should be handled in the helpers whereas in the controller it should focus on interaction with the model 
    def get_tagged(tweet)
        message_arr = Array.new
        message_arr = tweet.message.split
        message_arr.each_with_index do |word, index|
            if word[0] == "#"
                if Tag.pluck(:phrase).include?(word)
                    tag = Tag.find_by(phrase: word)
                else
                    tag = Tag.create(phrase: word)
                end
                tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
                message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
            end
        end

        tweet.message = message_arr.join(" ")
        return tweet
    end
end

