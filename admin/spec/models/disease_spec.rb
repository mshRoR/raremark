require 'rails_helper'

RSpec.describe Disease, type: :model do
  it "is valid with valid attributes" do
    disease = Disease.new(name: "disease 1")
    expect(disease).to be_valid
  end

  it "is not valid without a name" do
    disease = Disease.new()
    expect(disease).to_not be_valid
  end

end
