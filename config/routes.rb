Rails.application.routes.draw do
  # 公開用
  namespace :public do
    # トップ画面
    resources :tops, only: [:index] do
      collection do
        get 'company'
      end
    end

    
  end

  root to: "tops#index"
end
