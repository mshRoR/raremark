require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(name: "XYZ", email: "abc@gmail.com")
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(email: "abc@gmail.com")
    expect(user).to_not be_valid
  end

  it "is not valid without a email" do
    user = User.new(name: "xamm")
    expect(user).to_not be_valid
  end

end
