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

# rspec test for elastic search
describe User, search: true do
  it "elastic user searcch" do
    # create user with necessary data
    country = Country.create!(name: "United Kingdom", iso2: "UK")
    disease = Disease.create!(name: "Disease")
    User.create!(name: "John", email: 'lorem@apple.com',
                 profile_attributes: {
                     gender: 'Male', born_year: 1996, born_month: 3, country_id: country.id, profile_type: 1
                 },
                 disease_histories_attributes:[
                     disease_id: disease.id
                 ])

    # create index for newly created user
    User.reindex
    User.searchkick_index.refresh

    # validate search result

    # search by user name
    assert_equal ["John"], User.search("John").map(&:name)
    # search by user email
    assert_equal ["John"], User.search("lorem@apple.com").map(&:name)
    # search by user profile gender
    assert_equal ["John"], User.search("male").map(&:name)
    # search by user disease name
    assert_equal ["John"], User.search("Disease").map(&:name)
    # search by user country name
    assert_equal ["John"], User.search("United Kingdom").map(&:name)
    # search by user country iso2
    assert_equal ["John"], User.search("uk").map(&:name)

  end
end
