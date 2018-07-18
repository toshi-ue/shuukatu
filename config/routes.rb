Rails.application.routes.draw do

#   namespace :public do
#   namespace :settings do
#     get 'users/show'
#     end
#   end

  # namespace :public do
  # get 'orders/index'
  # end


  # namespace :public do
  # get 'cartitems/index'
  # end

  # namespace :public do
  # get 'cartitems/add_item'
  # end

  # BEGIN 公開用 ------------------------------------------------------------------

  # ユーザー設定用
  devise_for :users, controllers: {
    sessions:      'public/settings/users/sessions',
    passwords:     'public/settings/users/passwords',
    registrations: 'public/settings/users/registrations'
  }

  scope module: :public do

    # ユーザー設定用
    namespace :settings do

      # クレジット情報
      resources :credits, only: [:index, :show, :new, :create]

      # 住所情報
      resources :addresses

    # ユーザー情報の一覧画面
      # resources :users, only: [:index, :show] do
        # collection do
          get 'users/dashboard'#, on: :collection
          get 'users/security'
        # end
      # end
    end

    # トップ画面
    resources :tops, only: [:index] do
      collection do
        get 'company'
      end
    end

    # カート
    resources :cartitems, only: [:index] do
      collection do
        post 'add_item'
      end
    end

    # 注文
    resources :orders, only: [:index, :show, :new, :create]


    # googlemap表示用
    resources :positions
    # ジャンル
    resources :genres, only: [:show], shallow: true do
      resources :subgenres, only: [:show], shallow: true do
        resources :items, only: [:show]
      end
    end

    # ユーザー情報の一覧画面
    # resources :users, only: [:index, :show]
  end


  # BEGIN ショッパー用 ------------------------------------------------------------------
  devise_for :managers, controllers: {
    sessions:      'managers/devise/managers/sessions',
    passwords:     'managers/devise/managers/passwords',
    registrations: 'managers/devise/managers/registrations'
  }

  namespace :managers do
    get 'tops/dash_board'
    resources :positions
  end

  # master用 --------------------------------------------------------------------------
  namespace :master do
    resources :genres
  end

  # ルート
  root to: "public/tops#index"

end
