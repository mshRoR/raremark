class Disease < ApplicationRecord
    has_many :disease_histories

    validates :name, presence: true, uniqueness: true   
end
