class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :request_path
  before_action :set_controller_session
  before_action :count_cartitems, if: :user_signed_in?

  # bootstrapフラッシュメッセージ用
  add_flash_types :success, :info, :warning, :danger

  def request_path
    @path = controller_path + '#' + action_name
  end

  def set_controller_session
    if session[:first_controller].blank?
      session[:first_controller] = @path
    else
      session[:second_controller] = session[:first_controller]
      session[:first_controller] = @path
    end
  end

  def count_cartitems
    if user_signed_in?
      @cartitems = Cartitem.where(user_id: current_user.id, order_id: nil)
    end
  end


  # def after_sign_up_path_for(resource)
  #   case resources
  #     when User
  #       redirect_to root_path and return
  #   end
  # end

  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    when Manager
      managers_tops_dash_board_path
    end
  end

  # def after_sign_out_path_for(resource)
  #   case resource
  #   when User
  #     root_path
  #   when Manager
  #     new_manager_session_path
  #   end
  # end

end
