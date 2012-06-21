Sorteando::Application.routes.draw do
  resources :sorteios do
    member do
      get :sortear
    end
    resources :concorrentes, :only => [:new, :create, :destroy]
  end
  
  root :to => 'sorteios#index'
end
