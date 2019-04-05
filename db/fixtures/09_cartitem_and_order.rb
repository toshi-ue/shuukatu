def set_order_no(no, createdtime)
  digit_number = no.to_s.length
  tmp_no = "0" * (3 - digit_number) + no.to_s
  return "#{createdtime.strftime('%y%m%d')}#{tmp_no}"
end

@users = User.all
@items = Item.all

users_count = @users.count
cartitems_count = 0
orders_count = 0
no = 0
tmp_createdtime = Time.parse('1999/12/01').strftime('%y%m%d')

users_count.times do |a|

  loop_count = 0
  totalprice = 0
  item_ids = @items.pluck(:id)
  @user = User.find_by(id: (a + 1))

  random_value = rand(0..4)
  random_value_count = 0

  unless random_value == 0
    loop_count += 1
    random_value.times do

      cartitems_count += 1
      random_value_count += 1

      itemId = item_ids.sample
      item_ids.delete(itemId)

      cartitem = Cartitem.create!(
        user_id: nil,
        order_id: orders_count + 1,
        item_id: itemId,
        quantity: rand(1..3),
        created_at: (@user.created_at) + 10 * 60,
        updated_at: (@user.created_at) + 10 * 60,
      )
      totalprice += cartitem.item.price
    end


    no = tmp_createdtime != @user.created_at.strftime('%y%m%d') ? 1 : no + 1
    tmp_createdtime = @user.created_at.strftime('%y%m%d')

    Order.create!(
      order_no: set_order_no(no, @user.created_at + 15 * 60),
      user_id: (a+1),
      total_price: totalprice,
      address_id: @user.addresses.ids[0],
      created_at: (@user.created_at) + 15 * 60,
      updated_at: (@user.created_at) + 15 * 60,
    )
    orders_count += 1
  end
end

puts "created seed cartitems(#{cartitems_count} cartitems). [#{dispTime}]"
puts "created seed orders(#{orders_count} orders). [#{dispTime}]"
