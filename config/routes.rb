Rails.application.routes.draw do

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
