Rails.application.routes.draw do

  # BEGIN for users ------------------------------------------------------------------

  # ユーザー設定用
  devise_for :users, controllers: {
    sessions:      'public/settings/users/sessions',
    passwords:     'public/settings/users/passwords',
    registrations: 'public/settings/users/registrations',
    omniauth_callbacks: 'public/settings/users/omniauth_callbacks'
  }

  scope module: :public do

    # ユーザー設定用
    namespace :settings do

      # クレジット情報
      resources :credits, only: [:index, :show, :new, :create, :destroy]

      resources :addresses do
        get 'change_main_address', on: :member
      end

    # ユーザー情報の一覧画面
      get 'users/dashboard'#, on: :collection
      get 'users/security'
    end

    # トップ画面
    resources :tops, only: [:index] do
      collection do
        get 'company'
        get 'search'
      end
    end

    # カート
    resources :cartitems, only: [:index, :update, :destroy] do
      collection do
        post 'add_item'
      end
    end

    # 注文
    resources :orders, only: [:index, :show, :new, :create]

    # googlemap表示用
    resources :positions

    # ジャンル
    resources :genres, only: [:index, :show], shallow: true do
      resources :subgenres, only: [:index, :show], shallow: true do
        # resources :items, only: [:show]# do
          # collection do
          #   get 'search'
          # end
        #end
      end
    end
    get ':genre_name/:subgenre_name/:item_name', to: 'items#show', as: 'item'

    # ユーザー情報の一覧画面
    # resources :users, only: [:index, :show]
  end

  namespace :public do
    namespace :orders do
      get 'addresses/index'
      get 'addresses/new'
      post 'addresses/create'
      get 'credits/index'
      get 'credits/new'
      post 'credits/create'
    end
  end
  # END for users ------------------------------------------------------------------

  # BEGIN for managers ------------------------------------------------------------------
  devise_for :managers, controllers: {
    sessions:      'managers/devise/managers/sessions',
    passwords:     'managers/devise/managers/passwords',
    registrations: 'managers/devise/managers/registrations'
  }

  namespace :managers do
    get 'tops/dash_board'
    get 'tops/search'
    resources :positions

    resources :orders, only:[:index]
    resources :users, only:[:index, :show]
    resources :items
    resources :genres
    resources :subgenres
    get 'ordersdat/sum_dat'

  end
  # END for managers ------------------------------------------------------------------

  # BEGIN for masters --------------------------------------------------------------------------
  namespace :master do
    resources :genres
  end
  # BEGIN for masters --------------------------------------------------------------------------

  # root
  root to: "public/tops#index"

# メール確認用
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # TODOS 404エラーの復帰
  # get '*path', controller: 'application', action: 'render_404'

end
