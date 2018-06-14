Rails.application.routes.draw do

  devise_for :managers
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
  end

  # master用
  namespace :master do
    resources :genres do
      resources :subgenres
    end
  end

  # ルート
  root to: "public/tops#index"
end
