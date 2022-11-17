class Comment < ApplicationRecord
    belongs_to :review
    belongs_to :user

    validates :description, presence: true
    validates :name, presence: true

end
