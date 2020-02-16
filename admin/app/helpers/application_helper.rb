module ApplicationHelper
    def get_countries
        Country.all
    end

    def gender_list
        [ { "name" => "Male", "value" => "Male" } ]
    end

    def profile_type
        types = [
            { name: 'Patient', value: 1},
            { name: 'Carer', value: 2}
        ]
    end

    # user born year selection options
    def born_years
        year_range = (1960..Date.today.year-1)
        years = [['Select Year']]
        year_range.each do |year|
            years << year
        end

        years
    end

    # user born month selection options
    def born_months
        months = [
            ['Select Month'], ['January', 1], ['February', 2], ['March', 3], ['April', 4], ['May', 5], ['June', 6],
            ['July', 7], ['August', 8], ['September', 9], ['October', 10], ['November', 11], ['December', 12]
        ]
    end
end
