class Review < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments
    belongs_to :users
    belongs_to :category

    validates :title, presence: true
    validates :content, presence: true

end
