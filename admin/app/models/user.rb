class User < ApplicationRecord
    has_one :profile
    has_many :disease_histories

    validates :email, presence: true
    validates :name, presence: true

    accepts_nested_attributes_for(:profile, update_only: true)
    accepts_nested_attributes_for(:disease_histories, update_only: true)



    # enum status: {
    #     Active: 1,
    #     Suspended: 2,
    #     Deleted: 3
    # }
end
