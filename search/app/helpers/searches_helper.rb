module SearchesHelper
    def gender_chart(ids)
        Profile.where(user_id: ids).group(:gender).count
    end

    def country_chart(ids)
        Profile.joins(:country).where(user_id: ids).group('countries.name').count
    end

    def profile_type_chart(ids)
        DiseaseHistory.joins(:disease).where(user_id: ids).group('diseases.name').count
    end
end
