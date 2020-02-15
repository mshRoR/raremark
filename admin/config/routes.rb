Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users do
    member do
      put :suspend # use to suspend an user
      put :reactivate # use to reactivate an user after suspend
      put :delete # use to delete an user
    end

    collection do
      get :suspended # get suspended user list
      get :deleted # get deleted user list
    end
  end
end
