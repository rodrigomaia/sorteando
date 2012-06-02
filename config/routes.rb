Sorteando::Application.routes.draw do
  resources :sorteios do
    member do
      get :sortear
    end
    resources :concorrentes
  end
  
  root :to => 'sorteios#index'
end
