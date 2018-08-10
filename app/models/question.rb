class Question < ApplicationRecord
    has_one :user

    validates :text, length: { minimum: 5 }
end
