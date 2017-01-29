Rails.application.routes.draw do
  root 'home#index'
  resources :tweets, only: [:index, :new, :create, :show]
  resources :contacts
  resources :comments, only: [:create]
  resources :post, only: [:index, :show, :update], path: '/blogs'
  match '/live', to: "post#index", as: :live_blog, blog_type: "live", via: [:get]
  match '/dev', to: "post#index", as: :dev_blog, blog_type: "dev", via: [:get]
  match '/book', to: "post#index", as: :book_blog, blog_type: "book", via: [:get]
  resource :session, controller: "sessions", only: [:create, :destroy,  :new]

  resources :categories

  post 'upload' => 'file_attach#post_image'
  get '/language/:locale', to: 'home#language', as: :change_locale
  get '/download_pdf', to: 'home#download_pdf'

  namespace :admin do
    resources :users
    resources :posts
    resources :books
    resources :tweets
    resources :blog_posts
    resources :book_reviews
    resources :resume_posts
    resources :categories
  end

end
