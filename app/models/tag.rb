class Tag < ApplicationRecord
	has_many :tweet_tags
	has_many :tweets, though: :tweet_tags
end
