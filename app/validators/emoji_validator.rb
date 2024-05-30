class EmojiValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A[\p{Emoji}]/ # 正規表現で絵文字のみを許可
        record.errors[attribute] << (options[:message] || "must contain only emojis")
      end
    end
end