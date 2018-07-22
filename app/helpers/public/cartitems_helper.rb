module Public::CartitemsHelper

  def dispSelectBox(quantity, j)
    if quantity > 5
       select :"#{j}", :quantity, options_for_select((quantity).times.map{|i| i + 1}, quantity),{}, {class: 'form-control'}
    else
        select :"#{j}", :quantity, options_for_select(5.times.map{|i| i + 1}, quantity),{}, {class: 'form-control'}
    end
  end
end
