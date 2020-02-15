module ApplicationHelper
    def get_countries
        Country.all
    end

    def gender_list
        genders = [
            { name: 'Male', value: 'Male'},
            { name: 'Female', value: 'Female'}
        ]
    end
end
