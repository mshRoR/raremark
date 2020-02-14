class Country < ApplicationRecord
    has_one :profile

    validates :name, presence: true, uniqueness: true
end
