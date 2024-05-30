class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates_length_of :emoji, maximum: 1
  validate :emoji_only

  private
  def emoji_only
    unless emoji.match?(/[\p{Emoji}]/)
      errors.add(:emoji, "must contain only emojis")
    end
  end
end
