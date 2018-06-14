class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :request_path

# https://qiita.com/toduq/items/a9fa48926b060b2d8a5b
  def request_path
      @path = controller_path + '#' + action_name
      def @path.is(*str)
          str.map{|s| self.include?(s)}.include?(true)
      end
  end
end
