class Managers::TopsController < ApplicationController
  before_action :authenticate_manager!

  include OrderdatsToshort

  def dash_board
    # now = Time.current
    @orders = Order.include_other_models.page(params[:page]).per(20).reverse_order
    # binding.pry
    count_register_everyday_a_week
    # binding.pry
    totalsales_this_month
    totalsales_7days

    # get the number of days in the current month
    monthly_days = Time.days_in_month(Time.current.month, Time.current.year)

    # declare arrays for graph
    @sales_for_graph = []
    @order_numbers_for_graph = []
    @day_scale = []
    # the_day.strftime("%d(#{%w(日 月 火 水 木 金 土)[day.wday]})")

    monthly_days.times do |i|
      # values of each day
      the_day = Time.new(Time.current.year, Time.current.month, i + 1)
      sales_per_day = @monthly_orders.where(created_at: the_day.all_day)
      # scales
      @day_scale.push(the_day.strftime("%d(#{%w(日 月 火 水 木 金 土)[the_day.wday]})"))
      # sums of each day
      @sales_for_graph.push(sales_per_day.present? ? sales_per_day.sum(:total_price).to_i : 0)
      @order_numbers_for_graph.push(sales_per_day.count)
    end

    # set scale's maximum value
    @max_sales = @sales_for_graph.max
    digits_of_max_sales = @max_sales.abs.to_s.length
    var_ceil_sales = digits_of_max_sales == 1 ? 1 : digits_of_max_sales - 1
    @limit_of_sales_scale = @max_sales.ceil(-var_ceil_sales)

    @max_order_numbers = @order_numbers_for_graph.max
    digits_of_max_order_numbers = @max_order_numbers.abs.to_s.length
    var_ceil_order_numbers = digits_of_max_order_numbers == 1 ? 1 : digits_of_max_order_numbers - 1
    @upper_limit_of_order_numbers = @max_order_numbers.ceil(var_ceil_order_numbers)

    # binding.pry


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
