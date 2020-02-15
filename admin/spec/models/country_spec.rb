require 'rails_helper'

RSpec.describe Country, type: :model do
  it "is valid with valid attributes" do
    country = Country.new(name: "United States", iso2: "US")
    expect(country).to be_valid
  end

  it "is not valid without a name" do
    country = Country.new(iso2: "US")
    expect(country).to_not be_valid
  end

end
