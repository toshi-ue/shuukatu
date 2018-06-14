Rails.application.routes.draw do


  devise_for :managers, controllers: {
    sessions:      'managers/devise/managers/sessions',
    passwords:     'managers/devise/managers/passwords',
    registrations: 'managers/devise/managers/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'public/devise/users/sessions',
    passwords:     'public/devise/users/passwords',
    registrations: 'public/devise/users/registrations'
  }
  # 公開用
  scope module: :public do
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

  # master用
  namespace :master do

  end

  # ルート
  root to: "public/tops#index"
end
