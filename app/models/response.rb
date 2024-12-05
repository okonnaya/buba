class Response < ApplicationRecord
    validates :email, presence: true
end
