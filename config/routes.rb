Rails.application.routes.draw do
  resources :url_shorts
  root "url_shorts#new"
  get ':rgs' => 'url_shorts#view_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
