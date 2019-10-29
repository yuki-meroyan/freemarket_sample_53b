$(function () {
  function shipping_method_change () {
    delivery_fee = $('#item_delivery_fee').val();
    if (delivery_fee === "true") {
      $('#item_shipping_method').empty();
      $('#item_shipping_method').append(`
      <option value="">---</option>
      <option value="未定">未定</option>
      <option value="らくらくメルカリ便">らくらくメルカリ便</option>
      <option value="ゆうメール">ゆうメール</option>
      <option value="レターパック">レターパック</option>
      <option value="普通郵便(定型、定形外)">普通郵便(定型、定形外)</option>
      <option value="クロネコヤマト">クロネコヤマト</option>
      <option value="ゆうパック">ゆうパック</option>
      <option value="クリックポスト">クリックポスト</option>
      <option value="ゆうパケット">ゆうパケット</option>
      `);
    } else if(delivery_fee === "false"){
      $('#item_shipping_method').empty();
      $('#item_shipping_method').append(`
      <option value="">---</option>
      <option value="未定">未定</option>
      <option value="クロネコヤマト">クロネコヤマト</option>
      <option value="ゆうパック">ゆうパック</option>
      <option value="ゆうメール
      ">ゆうメール</option>
      `);
    }
  }

  $('#item_delivery_fee').change(function(){
    shipping_method_change ()
  });


  $(window).on("load", function(){
    if(document.URL.match(/edit/) && document.URL.match(/items/)) {
    shipping_method =$('#item_shipping_method').find('option').val();
    shipping_method_change ()
    selected = $('#item_shipping_method').find(`[value="${shipping_method}"]`);
    $('#item_shipping_method').val(`${shipping_method}`);
    }
  });
});