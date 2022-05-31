Rails.application.routes.draw do
  devise_for :users
  resources :moco_accounts, param: :ocomoco_id do
    resource :api_key, only: %i[edit update]
  end
end
