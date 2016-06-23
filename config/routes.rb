Rails.application.routes.draw do

  root 'home#index'
  resources :tweets
  resources :contacts
  post 'upload' => 'file_attach#post_image'

  resources :post, only: [:index,:show]

  namespace :admin do
    root to: "users#index"
    resources :users
    resources :posts
    resources :books
    resources :tweets
    resources :blog_posts
    resources :book_reviews
    resources :resume_posts
  end
end
