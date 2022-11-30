class Post < ApplicationRecord
    validates :title, presence:true # is expected to validate that :title cannot be empty/falsy
    validates :content, length: { minimum: 250} #  is expected to validate that the length of :content is at least 250
    validates :summary, length: { maximum: 250} #  is expected to validate that the length of :summary is at most 250
    validates :category, inclusion: { in: %w( Fiction Non-Fiction ) } # is expected to validate that :category is either ‹"Fiction"› or ‹"Non-Fiction"›
    validate :clickbait?

   # Custom validations: title is clickbait
   # is expected to allow :title to be ‹"You Won't Believe These True Facts"›
   # is expected not to allow :title to be ‹"True Facts"
    def clickbait?
        if title && !title.match(/Won't Believe|Secret|Top [0-9]|Guess/)
            errors.add(:title, "must be clickbait")
        end
    end

end
