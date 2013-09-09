NdaApp::Application.routes.draw do
  devise_for :users
  resources :admin, path: "admin", only: [:index]
  namespace :admin do
    get '/settings', action: 'settings', as: :settings
    resources :non_disclosure_agreements, path: "/ndas"
    resources :users
  end
  resources :signatures, except: [:index]
  root to: "signatures#index"
end
