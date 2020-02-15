class Profile < ApplicationRecord
  belongs_to :country
  belongs_to :user

  validates :gender, presence: true
  validates :born_year, presence: true
  validates :born_month, presence: true
  validates :profile_type, presence: true

  accepts_nested_attributes_for(:country, update_only: true)

  enum profile_type: {
    'Patient': 1,
    'Carer': 2
  }

  def month_name
     Date::MONTHNAMES[self.born_month]
  end
end
