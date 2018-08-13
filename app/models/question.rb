class Question < ApplicationRecord
    belongs_to :user, optional: true

    validates :text, length: { minimum: 5 }
end
