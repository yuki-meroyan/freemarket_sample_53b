
$(function() {
  var images = [];
  var inputs  =[];
  var input_area = $('.upload__box');
  var images_count = $('.edit-item__images__image').length;

  // プレビューファイルの読み込み等
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        var prev = $('#upload__file__previews').find('#avatar_img_prev');
        $(prev).attr('src', e.target.result);
        $('#upload__file__previews').removeAttr('id');
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
// 投稿ボタンのサイズ変更
  function dpboxSize(images_count ) {
    switch( images_count ) {
      case 1:
      case 6:
      case 11:
          console.log(images_count);
          $(input_area).css({'width':'600px','margin-left': '10px'});
          break;
      case 2:
      case 7:
          console.log(images_count);
          $(input_area).css({'width':'480px','margin-left': '10px'});
          break;
      case 3:
      case 8:
          console.log(images_count);
          $(input_area).css({'width':'350px','margin-left': '10px'});
          break;
      case 4:
      case 9:
          console.log(images_count);
          $(input_area).css({'width':'230px','margin-left': '10px'});
          break;
      case 5:
      case 10:
          console.log(images_count);
          $(input_area).css({'width':'100px','margin-left': '10px'});
          break;
    };
  }



  $(document).on('change', '#post_img,#post_img_last',function(event) {
    var html = `<div class="hidden" id="upload__file__previews">
    <img src=" " class="edit-item__images__image" id="avatar_img_prev" data-image = ${images.length + 1}>
    <div class="edit-item__images__btns">
      <a class="edit-item__images__btns__edit" href="#" >編集</a>
      <a class="edit-item__images__btns__delete" href="#" >削除</a>
    </div>
  </div>`
    inputs.push($(this));
    $('#upload__file__previews').removeClass('hidden');
    readURL(this);
    $('#upload__file__previews').addClass('edit-item__images');

      $('.upload__box').before(html);
    images.push(html);
    var new_input = $(`<input multiple= "multiple" name="item[item_images_attributes][][image]" class="sell__upload__drop-file" data-image= ${images.length} type="file" id="post_img" accept="image/*">`);
    input_area.prepend(new_input);
    images_count = $('.edit-item__images__image').length;
    dpboxSize(images_count);
    // 一番上のインプットだけ押せるように表示。
    $(input_area).children(":first").css({'display':'block'});
    // 選択したインプットは消す。
    $(this).css({'display':'none'});
  });




// 新しく投稿した画像の削除ボタン（完成）
  $('body').on('click', ".edit-item__images__btns__delete",  function(e) {
    e.preventDefault();
    var target = $(this).parent().parent();
    var target_image= target.find('img');
    $.each(inputs, function(index, input){
      if ($(input).data('image') == target_image.data('image')){
        $(input).remove();
        target.remove();
        images.splice(index, 1);
        inputs.splice(index, 1);
        if(inputs.length == 0) {
          $('#post_img_last,#post_img').attr({
            'data-image': 0
          });
          $('#avatar_img_prev').attr({
            'data-image': 0
          });
        }
      }
    })
    images_count = $('.edit-item__images__image').length;
    dpboxSize(images_count);
  });
もともとあるアイテムに対しての削除ボタン
  $('.motomoto_btn').click(function(e){
    e.preventDefault();
    var inputId = $(this).data('id');
    $(this).prev().prev().prop('value', "1");
    $(this).parent().parent().hide();
    var deleteimg = $(this).parent().parent().find('img');
    deleteimg.remove();
    images_count = $('.edit-item__images__image').length;
    dpboxSize(images_count);
  });



});
