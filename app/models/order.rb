class Order < ActiveRecord::Base
  # pagination
  paginates_per 40

  #relation
  belongs_to :address
  belongs_to :credit
  belongs_to :dvendor
  belongs_to :user
  has_many :cartitems
  has_many :items, through: :cartitems

  #validation
  validates :order_no, presence: true
  validates :user_id, presence: true
  validates :address_id, presence: true
  # validates :dvendor_id, presence: true, on: :update
  # validates :d_number, length: {in: 10..13}, on: :update


  def set_order_no
    get_last_order
    set_current_day
    check_order_no(get_last_order, set_current_day)
  end

  def set_current_day
    # 現在時刻の取得
    t = Time.current
    t.strftime("%y%m%d")
  end

  def get_last_order
    # 最後の注文の注文番号取得
    Order.select("order_no").last.order_no
  end

  def check_order_no(order_no, current_day)
    # binding.pry
    if((order_no == nil) || !(order_no.start_with?(current_day.to_s)))
      self.order_no = ("#{current_day}" + "001")
    else
      self.order_no = ((order_no).to_i + 1).to_s
    end
  end

  def pay_by_credit
    Payjp::Charge.create(
        amount: self.total_price,
        customer: Credit.find_by(user_id: self.user.id).customer_id,
        currency: 'jpy'
    )
  end
end
