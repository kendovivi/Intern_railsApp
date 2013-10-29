Blog::Application.routes.draw do
  
  resources :posts do
    resources :comments do
      member do
      	#link to del page for each comment
      	get 'del'
      end
    end
  end
  
  root to: "welcome#index"
end
