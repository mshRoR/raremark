class DiseaseHistory < ApplicationRecord
  belongs_to :user
  belongs_to :disease
  
end
