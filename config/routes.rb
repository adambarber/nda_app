NdaApp::Application.routes.draw do
  resources :admin, path: "admin", only: [:index]

  namespace :admin do
    resources :non_disclosure_agreements, path: "/ndas"
  end

  devise_for :users
end
