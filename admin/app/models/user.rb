class User < ApplicationRecord
    searchkick callbacks: false

    has_one :profile
    has_many :disease_histories

    scope :search_import, -> { includes(:disease_histories=> [:disease], :profile=>[:country]) }

    validates :email, presence: true
    validates :name, presence: true

    # enum status: {
    #     Active: 1,
    #     Suspended: 2,
    #     Deleted: 3
    # }
    def search_data
        {
            name: name,
            email: email,
            gender: profile.gender,
            profile_type: profile.profile_type,
            born_year: profile.born_year,
            born_month: profile.born_month,
            country: profile.country.name,
            disease: disease_histories.last.disease.name
        }
    end
end
