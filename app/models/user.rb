class User < ApplicationRecord
    has_many :comments
    has_many :reviews
    has_many :reviews, through: :comments

    has_secure_password

    validates :email, presence: true
    validates :username, presence: true
    validates :username, uniqueness: {message: "This username has already been taken"}
    validates :password, :length => { :minimum => 6 }
end
