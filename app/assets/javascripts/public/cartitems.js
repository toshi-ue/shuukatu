// 数量変更
  $(function() {
    $(document).on('turbolinks:load', function () {

      $("[id$=_quantity]").change(function() {

        // 数量の取得
        $quantity = $(this).val();
        // console.log("quantity: " + $quantity);

        // 要素番号の取得
        var index = $(this).attr('id').replace(/_quantity/g, '');
        // console.log("index: " + index);

        // 要素番号を元にcartitem_idを取得
        var $cartitem_id = $("[id^=%index-]".replace("%index", index)).attr('id').replace(/_img/g, '').replace(index + '-', '');
        // console.log("cartitem_id: " + $cartitem_id);

        $.ajax({
          url: "cartitems/" + $cartitem_id,
          type: "patch",
          cache: false,
          data: {
            id: $cartitem_id,
            quantity: $quantity,
          },
          async: true
        });
      });

    });
  });


