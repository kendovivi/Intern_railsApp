Blog::Application.routes.draw do
  
  resources :posts do
    resources :comments do
      member do
      	get 'del'
      end
    end
  end
  
  root to: "welcome#index"
end
