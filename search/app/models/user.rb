class User < ApplicationRecord
    searchkick callbacks: false

    has_one :profile
    has_many :disease_histories

    scope :search_import, -> { includes(:disease_histories=> [:disease], :profile=>[:country]) }

    validates :email, presence: true
    validates :name, presence: true

    accepts_nested_attributes_for(:profile, update_only: true)
    accepts_nested_attributes_for(:disease_histories, update_only: true)

    def search_data
        {
            name: name,
            email: email,
            gender: profile.gender,
            profile_type: profile.profile_type,
            born_year: profile.born_year,
            born_month: profile.born_month,
            country: profile.country.name,
            iso2: profile.country.iso2,
            disease: disease_histories.last.disease.name
        }
    end
end
