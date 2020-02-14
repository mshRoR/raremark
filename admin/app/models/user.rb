class User < ApplicationRecord
    has_one :profile
    has_many :disease_histories

    validates :email, presence: true
    validates :name, presence: true

    # enum status: {
    #     Active: 1,
    #     Suspended: 2,
    #     Deleted: 3
    # }
end
