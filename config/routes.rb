Rails.application.routes.draw do

  namespace :public do
  get 'tops/index'
  end

  namespace :public do
  get 'tops/company'
  end

end
