module OrderdatsToshort
  extend ActiveSupport::Concern

  def count_register_everyday_a_week
    now = Time.current
    # 1週間のユーザー登録数を集計する
    @users = User.where('created_at >= ?', now.ago(7.days))
    @sum_registers = []

    8.times do |i|
      @sum_registers.push((User.where('created_at = ?', now.ago(i.days)).size).to_i)
    end
    # binding.pry
  end

  def totalsales_this_month
    now = Time.current
    @total_sales_monthly = 0
    @monthly_orders = @orders.include_other_models.where(created_at: now.beginning_of_month..now.end_of_month)
    @monthly_orders.each do |order|
      @total_sales_monthly += (order.total_price).to_i
      # binding.pry
    end
    # binding.pry
  end

  def totalsales_7days
    now = Time.current
    # now = "#{now}"
    @days = []
    @total_sales_weekly = []
    # @orders.where('created_at = ?', now.beginning_of_week)
    # @now = @orders.where(created_at: now.beginning_of_day..now.end_of_day)
    # binding.pry
    6.times do |i|
      @days.push(now.ago(i.days))
      @daily_orders = @orders.include_other_models.where(created_at: now.ago(i.days).beginning_of_day..now.ago(i.days).end_of_day)
      # binding.pry
      @sales = 0
      @daily_orders.each do |order|
        @sales += (order.total_price).to_i
      end

      @total_sales_weekly.push(@sales)
    end
    # binding.pry
  end

end
