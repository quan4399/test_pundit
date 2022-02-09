Rails.application.routes.draw do
  devise_for :users
  as :user do
    get 'sign_out' => "devise/sessions#destroy"
  end
  devise_scope :user do

    authenticated :user do
      root 'home#index', as: :authenticated_root
      resources "post"
    end


    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
