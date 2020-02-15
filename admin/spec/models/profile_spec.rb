require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'profile tests' do

    let(:country) { FactoryBot.create :country }
    let(:user) { FactoryBot.create :user }

    it "is valid with valid attributes" do
      profile = Profile.new(user_id: user.id, gender: "Male", born_year: "1998", born_month: 2, country_id: country.id, profile_type: 1)
      expect(profile).to be_valid
    end

    it "is not valid without user" do
      profile = Profile.new(gender: "Male", born_year: "1998", born_month: 2, country_id: country.id, profile_type: 1)
      expect(profile).to_not be_valid
    end

    it "is not valid without country" do
      profile = Profile.new(user_id: user.id, gender: "Male", born_year: "1998", born_month: 2, profile_type: 1)
      expect(profile).to_not be_valid
    end


    it "is not valid without gender" do
      profile = Profile.new(user_id: user.id,  born_year: "1998", born_month: 2, country_id: country.id, profile_type: 1)
      expect(profile).to_not be_valid
    end

    it "is not valid without born year" do
      profile = Profile.new(user_id: user.id, gender: "Male",  born_month: 2, country_id: country.id, profile_type: 1)
      expect(profile).to_not be_valid
    end

    it "is not valid without born month" do
      profile = Profile.new(user_id: user.id, gender: "Male", born_year: "1998",  country_id: country.id, profile_type: 1)
      expect(profile).to_not be_valid
    end

    it "is not valid without profile type" do
      profile = Profile.new(user_id: user.id, gender: "Male", born_year: "1998", born_month: 2, country_id: country.id)
      expect(profile).to_not be_valid
    end


  end
end
