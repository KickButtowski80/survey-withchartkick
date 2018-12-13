Rails.application.routes.draw do
  get 'answser/index'
  resources :tasks do   
    collection do
      put :complete
    end      
  end
  
  resources :answers 
  get 'tasks/report' , to: 'tasks#report'
  
  root to: "tasks#index"
  
  mount ActionCable.server, at: '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
