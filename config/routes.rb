Rails.application.routes.draw do


  devise_for :managers, controllers: {
    sessions:      'managers/devise/managers/sessions',
    passwords:     'managers/devise/managers/passwords',
    registrations: 'managers/devise/managers/registrations'
  }


  # 公開用
  scope module: :public do
    # ユーザー設定用
    devise_for :users, controllers: {
      sessions:      'public/settings/users/sessions',
      passwords:     'public/settings/users/passwords',
      registrations: 'public/settings/users/registrations'
    }
    scope module: :settings do
      resources :addresses, except: [:delete]
    end

    # トップ画面
    resources :tops, only: [:index] do
      collection do
        get 'company'
      end
    end

    # googlemap表示用
    resources :positions
    # ジャンル
    resources :genres, only: [:show], shallow: true do
      resources :subgenres, only: [:show], shallow: true do
        resources :items, only: [:show]
      end
    end
  end

  #ショッパー用
  namespace :manager do

  end


  # master用
  namespace :master do
    resources :genres
  end

  # ルート
  root to: "public/tops#index"
end
