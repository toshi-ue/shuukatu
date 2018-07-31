$(document).on('turbolinks:load', function() {

  // 住所の自動入力
  return $("#address_postalcode").jpostal({
    postcode: ["#address_postalcode"],
    address: {
      "#address_prefecture_id": "%3",
      "#address_city": "%4%5",
      "#address_street": "%6%7"
    }
  });

});
