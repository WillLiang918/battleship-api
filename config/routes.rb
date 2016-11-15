Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games, defaults: { format: :json } do
    collection do
      get :leaderboard
      put :strike
      put :place_ship
      put :submit_initials
    end
  end
end
