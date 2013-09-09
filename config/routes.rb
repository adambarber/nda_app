NdaApp::Application.routes.draw do
  resources :admin, path: "admin"
  devise_for :users
end
