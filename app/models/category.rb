class Category < ApplicationRecord
    has_many :reviews

    validates :title, presence: true
end
