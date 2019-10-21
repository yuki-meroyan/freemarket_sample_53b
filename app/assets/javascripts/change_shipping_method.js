$(function () {
  $('#item_delivery_fee').change(function(){
    var id = $(this).val();
    if (id === "true") {
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
    } else if(id === "false"){
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

  });
});