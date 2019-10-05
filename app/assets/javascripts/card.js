$(function(){
  $(document).on('turbolinks:load', function() {
    
    var url = location.pathname;;
    // 違うビューでid:card-new__formが存在していても反応しないようにしています
    if (url == '/cards/new' ) {
      
      $('#card-new__form').on("click", function(e){

        Payjp.setPublicKey('pk_test_2e92f0b22242789bc2f990c0');
        
        //ボタンを一旦無効化
        e.preventDefault(); 

        // disabled属性=HTML要素を無効にする
        $('#card-new__submit').prop('disabled', true);
        
        // TODO: 登録情報は仮固定
        // var number = $('#card-new__number').val();
        // var cvc = $('#card-new__card-security-code').val();
        // var exp_month = $('#card-new__card-expire-mm').val();
        // var exp_year = $('#card-new__card-expire-yy').val();

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
        
        // トークン生成
        Payjp.createToken(card, function(status, response) {
          
          if (status == 200) {
            
            $("#card-new__number").removeAttr("name");
            $("#card-new__card-security-code").removeAttr("name");
            $("#card-new__card-expire-mm").removeAttr("name");
            $("#card-new__card-expire-yy").removeAttr("name"); //データを自サーバにpostしないように削除
            $("#card-new__form").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); 
            $("#card-new__form").submit();
            $('#card-new__submit').prop('disabled', false);
            alert("登録が完了しました");

          } else {
            alert("カード情報が正しくありません。"); 
          }
        });
      });
    }
  });
});