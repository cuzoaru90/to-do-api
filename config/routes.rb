Rails.application.routes.draw do
  devise_for :users

  scope '/api' do
     resources :lists, except: [:update] do
       resources :items
     end
  end

  scope '/api' do
     resources :users, except: [:update]
  end


end
