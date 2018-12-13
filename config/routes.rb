Rails.application.routes.draw do
  
  resources :tasks do   
    collection do
      post :complete
    end      
  end
  
  resources :answers 
 
  
  root to: "tasks#index"
  
  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
