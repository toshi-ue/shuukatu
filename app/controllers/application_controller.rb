class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :request_path
  before_action :controller_session

  # bootstrapフラッシュメッセージ用
  add_flash_types :success, :info, :warning, :danger

# https://qiita.com/toduq/items/a9fa48926b060b2d8a5b
  def request_path
      @path = controller_path + '#' + action_name
      def @path.is(*str)
          str.map{|s| self.include?(s)}.include?(true)
      end
  end

  def controller_session

    session[:fifth_controller] = session[:fourth_controller]
    session[:fourth_controller] = session[:third_controller]
    session[:third_controller] = session[:second_controller]
    session[:second_controller] = session[:first_controller]
    session[:first_controller] = @path
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
