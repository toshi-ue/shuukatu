class OrderMailer < ApplicationMailer

  default from: "うえのとしひろのしょっぴんぐさいと <toshihiro.no.ecsite@gmail.com>"

  def send_when_create(order)
    @order = order

    mail to: @order.user.email,
      subject: "注文が完了しました"

    # binding.pry
  end
end
