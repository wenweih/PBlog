Rails.application.routes.draw do
  root 'home#index'
  resources :tweets
  resources :contacts
  resources :comments, only: [:create]
  resources :post, only: [:index,:show], path: '/blogs'
  match '/live', to: "post#index", as: :live_blog, blog_type: "live", via: [:get]
  match '/dev', to: "post#index", as: :dev_blog, blog_type: "dev", via: [:get]
  match '/book', to: "post#index", as: :book_blog, blog_type: "book", via: [:get]
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
