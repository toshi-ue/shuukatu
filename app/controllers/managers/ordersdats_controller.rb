class Managers::OrdersdatsController < ApplicationController
  before_action :authenticate_manager!

  def sum_dat
    @ordersdat.save_to_record
  end

  private
  def orderdat_params
    params.require(:orderdat).permit(:dat, :sum_sales, :sum_register)
  end
end
