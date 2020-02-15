require 'rails_helper'

RSpec.describe DiseaseHistory, type: :model do
  context 'profile tests' do

    let(:disease) { FactoryBot.create :disease }
    let(:user) { FactoryBot.create :user }

    it "is valid with valid attributes" do
      disease_history = DiseaseHistory.new(user_id: user.id, disease_id: disease.id)
      expect(disease_history).to be_valid
    end

    it "is not valid without user" do
      disease_history = DiseaseHistory.new(disease_id: disease.id)
      expect(disease_history).to_not be_valid
    end

    it "is not valid without disease" do
      disease_history = DiseaseHistory.new(user_id: user.id)
      expect(disease_history).to_not be_valid
    end


  end


end
