module SearchesHelper
    def profile_chart(ids)
        Profile.where(user_id: ids).group(:gender).count
    end
end
