class Tweet < ApplicationRecord
  belongs_to :user
  validates :message, presence: true, length: {maximum: 220, too_long: "A tweet is only 220 characters"}
end