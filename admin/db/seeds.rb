# Country seed data
countrys = [
    {  name: 'United Kingdom', iso2: 'UK' },
    {  name: 'United States', iso2: 'US' },
    {  name: 'South Africa', iso2: 'SA' },
    {  name: 'Australia', iso2: 'AU' },
    {  name: 'Bangladesh', iso2: 'BD' }
]

puts "Creating Countries from seed data"
countrys.each do |cty|
    Country.create(cty) unless Country.find_by(iso2: cty[:iso2])
end

# Diseases seed data
diseases = [
    { name: 'Diseases 1' },
    { name: 'Diseases 2' },
    { name: 'Diseases 3' },
    { name: 'Diseases 4' },
    { name: 'Diseases 5' }
]

puts "Creating Diseases from seed data"
diseases.each do |dis|
    Disease.create(dis) unless Disease.find_by(name: dis[:name])
end

# Create users, user profile and user disease_histories dat from seed 
users = [
    { name: 'John', email: 'john@mail.com' },
    { name: 'Mary', email: 'mary@mail.com' },
    { name: 'James', email: 'james@mail.com' },
    { name: 'Cooper', email: 'cooper@mail.com' },
    { name: 'Peter', email: 'peter@mail.com' }
]

profiles = [
    { gender: 'Male', born_year: 1970, born_month: 11, country_id: 1, profile_type: 'Patient' },
    { gender: 'Female', born_year: 1990, born_month: 3, country_id: 2, profile_type: 'Carer' },
    { gender: 'Male', born_year: 1980, born_month: 6, country_id: 3, profile_type: 'Patient' },
    { gender: 'Male', born_year: 2000, born_month: 8, country_id: 4, profile_type: 'Patient' },
    { gender: 'Male', born_year: 2005, born_month: 9, country_id: 2, profile_type: 'Carer' }
]

disease_histories = [
    { disease_id: 1 },
    { disease_id: 2 },
    { disease_id: 3 },
    { disease_id: 4 },
    { disease_id: 5 }
]

puts "Creating users, user profile and user disease histories from seed data"
users.each_with_index do |u, i|
    user = User.create(u) unless User.find_by(email: u[:email])
    if user
        user.create_profile(profiles[i]) unless user.profile
        user.disease_histories.create(disease_histories[i])
    end
end
