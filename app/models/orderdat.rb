class Orderdat < ActiveRecord::Base
  # 日ごとの集計
  def save_to_record
    self.new
    now = Time.current
    self.dat = now.yesterday

    @orders = Order.where('created_at = ?', now.yesterday)
    self.sum_sales = @orders.sum(:total_price).to_i
    @users = User.where('created_at = ?', now.yesterday)
    self.sum_register = @users.size
    self.create(orderdat_params)
  end
end
