Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :tweets
  resources :contacts
  resources :post, only: [:index,:show]
  resource :session, controller: "sessions", only: [:create, :destroy,  :new]

  post 'upload' => 'file_attach#post_image'
  get '/language/:locale', to: 'home#language', as: :change_locale

  namespace :admin do
    resources :users
    resources :posts
    resources :books
    resources :tweets
    resources :blog_posts
    resources :book_reviews
    resources :resume_posts
  end

end
