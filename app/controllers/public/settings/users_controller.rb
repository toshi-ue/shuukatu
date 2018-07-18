class Public::Settings::UsersController < ApplicationController
  before_action :authenticate_user!


  def dashboard
  end

  def security
  end
end
