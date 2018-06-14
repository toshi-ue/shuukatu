Rails.application.routes.draw do


  devise_for :managers, controllers: {
    sessions:      'managers/sessions',
    passwords:     'managers/passwords',
    registrations: 'managers/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
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
    resources :genres, only: [:show]
  end

  # master用
  namespace :master do

  end

  # ルート
  root to: "public/tops#index"
end
