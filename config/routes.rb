Rails.application.routes.draw do
  resources :diary_entries
  root "diary_entries#index"
end

