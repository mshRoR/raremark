# Country seed data
countrys = [
    { id: 1, name: 'United Kingdom', iso2: 'UK' },
    { id: 2, name: 'United States', iso2: 'US' },
    { id: 3, name: 'South Africa', iso2: 'SA' },
    { id: 4, name: 'Australia', iso2: 'AU' },
    { id: 5, name: 'Bangladesh', iso2: 'BD' }
]

puts "Creating Countries from seed data"
countrys.each do |cty|
    Country.create(cty)
end

# Diseases seed data
diseases = [
    { id: 1, name: 'Diseases 1' },
    { id: 2, name: 'Diseases 2' },
    { id: 3, name: 'Diseases 3' },
    { id: 4, name: 'Diseases 4' },
    { id: 5, name: 'Diseases 5' }
]

puts "Creating Diseases from seed data"
diseases.each do |dis|
    Disease.create(dis)
end

# Create users, user profile and user disease_histories dat from seed 
users = [
    { id: 1, name: 'John', email: 'john@mail.com' },
    { id: 2, name: 'Mary', email: 'mary@mail.com' },
    { id: 3, name: 'James', email: 'james@mail.com' },
    { id: 4, name: 'Cooper', email: 'cooper@mail.com' },
    { id: 5, name: 'Peter', email: 'peter@mail.com' }
]

profiles = [
    { id: 1, gender: 'Male', born_year: 1970, born_month: 11, age_range: '20-50', country_id: 1, profile_type: 'Patient' },
    { id: 2, gender: 'Female', born_year: 1990, born_month: 3, age_range: '20-50', country_id: 2, profile_type: 'Carer' },
    { id: 3, gender: 'Male', born_year: 1980, born_month: 6, age_range: '20-50', country_id: 3, profile_type: 'Patient' },
    { id: 4, gender: 'Male', born_year: 2000, born_month: 8, age_range: '20-50', country_id: 4, profile_type: 'Patient' },
    { id: 5, gender: 'Male', born_year: 2005, born_month: 9, age_range: '10-20', country_id: 2, profile_type: 'Carer' }
]

disease_histories = [
    { id: 1, disease_id: 1 },
    { id: 2, disease_id: 2 },
    { id: 3, disease_id: 3 },
    { id: 4, disease_id: 4 },
    { id: 5, disease_id: 5 }
]

puts "Creating users, user profile and user disease histories from seed data"
users.each_with_index do |u, i|
    user = User.where(id: u[:id]).first_or_create(u)
    if user
        user.create_profile(profiles[i]) unless user.profile
        user.disease_histories.where(id: disease_histories[i][:id]).first_or_create(disease_histories[i])
    end
end
