$(function(){
  
  $('#card-new__form').on("submit", function(e){
    e.preventDefault(); //ボタンを一旦無効化します
    // disabled属性=HTML要素を無効にする
    // $('#card-new__submit').prop('disabled', true);
    var formData = new FormData(this);
    // TODO: 登録情報は仮固定
    // var number = formData.get('card_number');
    // var cvc = formData.get('security_code');
    // var exp_month = formData.get('exp_month');
    // var exp_year = formData.get('exp_year');
    var number = '4242424242424242';
    var cvc = '123';
    var exp_month = '2';
    var exp_year = '2020';
    
    var card = {
      number: number,
      cvc: cvc,
      exp_month: exp_month,
      exp_year: exp_year
    };
    Payjp.setPublicKey('pk_test_2e92f0b22242789bc2f990c0');
    
    // トークン生成
    Payjp.createToken(card, (status, response) => {
      if (status === 200) { //成功した場合
        $("#card-new__number").removeAttr("name");
        $("#card-new__card-security-code").removeAttr("name");
        $("#card-new__card-expire-mm").removeAttr("name");
        $("#card-new__card-expire-yy").removeAttr("name"); //データを自サーバにpostしないように削除
        $("#card-new__token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        ); 
        //取得したトークンを送信できる状態
        $('#card-new__form').submit();
        alert("登録が完了しました");
        $('#card-new__submit').prop('disabled', false);
      } else {
        alert("トークンの取得に失敗しました" + response.error.message);
        $('#card-new__submit').prop('disabled', false);
      }

    });
    
  })
})

// document.addEventListener('DOMContentLoaded', (e) => {
//   // payjp.jsの初期化
//   Payjp.setPublicKey('pk_test_2e92f0b22242789bc2f990c0');
  
//   // ボタンのイベントハンドリング
//   const btn = document.getElementById('card-new__submit');
//   btn.addEventListener('click', (e) => {
//     e.preventDefault();

//     // カード情報生成
//     const card = {
//       number: document.getElementById('card-new__number').value,
//       cvc: document.getElementById('card-new__card-security-code').value,
//       exp_month: document.getElementById('card-new__card-expire-mm').value,
//       exp_year: document.getElementById('card-new__card-expire-yy').value
//     };
    
//     // トークン生成
//     Payjp.createToken(card, (status, response) => {
//       if (status === 200) { //成功した場合
//         $("#card_number").removeAttr("name");
//         $("#cvc").removeAttr("name");
//         $("#exp_month").removeAttr("name");
//         $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
//         $("#card_token").append(
//           $('<input type="hidden" name="payjp-token">').val(response.id)
//         ); //取得したトークンを送信できる状態にします
//         document.inputForm.submit();
//         alert("登録が完了しました"); //確認用
//       } else {
//         alert("カード情報が正しくありません。"); //確認用
//       }

//     });
//   });
// }, false);