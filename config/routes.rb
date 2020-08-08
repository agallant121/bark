Rails.application.routes.draw do
  root to: 'home#index'
  resources :restaurants do
    resources :reviews do
      # delete '/:id/comment', to: 'reviews#destroy_comment'
    end
  end
  patch '/restaurants/:restaurant_id/reviews/:review_id/comment', to: 'reviews#update'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
