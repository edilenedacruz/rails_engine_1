Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
      end
      resources :merchants, except: [:new, :edit]

      resources :payments, path: 'transactions', only: [:index, :show, :create] do
          collection do
            get '/find', to: 'payments/search#show'
            get '/find_all', to: 'payments/search#index'
            # get '/:id/invoices', to: 'payments/invoices#show'
          end
        end

      namespace :customers do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'payments#index'
      end
      resources :customers, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
      end
      resources :invoices, only: [:index, :show]

      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchant#show'
      end
      resources :items, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
        get '/:id/invoice', to: 'invoice#show'
        get '/:id/item', to: 'item#show'
      end
      resources :invoice_items, only: [:index, :show]
      end
    end
  end
