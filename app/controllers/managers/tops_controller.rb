class Managers::TopsController < ApplicationController
  before_action :authenticate_manager!

  include OrderdatsToshort

  def dash_board
    # now = Time.current
    @orders = Order.includes(:cartitems).page(params[:page]).per(40).reverse_order
    # binding.pry
    count_register_everyday_a_week
    # binding.pry
    totalsales_this_month
    totalsales_7days

  end

    def search
        # @q = Order.includes(:cartitems).page(params[:page]).per(40).reverse_order
        # @q = Order.ransack(params[:q])
        if params[:q]["order_no_cont"].blank?
          redirect_to managers_tops_dash_board_path, warning: "検索したい内容を再度確認して入力してください"
        else
          @orders = @q.result
        end
    end

  def search_params
    params.require(:q).permit!
  end
end
