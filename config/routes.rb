Rails.application.routes.draw do
  post '/memberslist', to: "users#zip_codes"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
