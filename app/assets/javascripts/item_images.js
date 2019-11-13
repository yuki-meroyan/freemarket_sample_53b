
$(function() {
  var images        = [];
  var inputs        = [];
  var input_area    = $('.upload__box');
  var count;
  var images_count;
  
  // 投稿ボタンのサイズ変更
  function dpboxSize(images_count ) {
    switch( images_count ) {
      case 1:
      case 6:
          $(input_area).css({'width':'600px','margin-left': '10px'});
          break;
      case 2:
      case 7:
          $(input_area).css({'width':'490px','margin-left': '10px'});
          break;
      case 3:
      case 8:
          $(input_area).css({'width':'360px','margin-left': '10px'});
          break;
      case 4:
      case 9:
          $(input_area).css({'width':'240px','margin-left': '10px'});
          break;
      case 5:
      case 10:
          $(input_area).css({'width':'110px','margin-left': '10px','display':'block'});
          break;
      case 11:
          $(input_area).css({'display':'none',});
    };
  }

  $(window).on("load", function(){
      images_count = $('.edit__item__images__image').length;
      dpboxSize(images_count);
      $("#post__img__last").prop('name', `item[item_images_attributes][${images_count + 1}][image]`);
      count = parseInt(images_count + 2);
  });

  // プレビューファイルの読み込み等
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        var prev = $('#upload__file__previews').find('#item__img__prev');
        $(prev).attr('src', e.target.result);
        $('#upload__file__previews').removeAttr('id');
      }
      reader.readAsDataURL(input.files[0]);
    }
  }


//ファイルが決まった後
  $(document).on('change', '#post__img,#post__img__last',function(event) {
    var html = `<div class="hidden" id="upload__file__previews">
    <img src=" " class="edit__item__images__image" id="item__img__prev" data-image = ${images.length + 1}>
    <div class="edit__item__images__btns">
      <a class="edit__item__images__btns__edit" href="#" >編集</a>
      <a class="upload-item__images__btns__delete" href="#" >削除</a>
    </div>
  </div>`
    inputs.push($(this));
    $('#upload__file__previews').removeClass('hidden');
    readURL(this);
    $('#upload__file__previews').addClass(`edit__item__images`);
    $('.upload__box').before(html);
    images.push(html);
    var new_input = $(`<input name="item[item_images_attributes][${count}][image]" class="sell__upload__drop-file" data-image= ${images.length} type="file" id="post__img" accept="image/*">`);
    input_area.append(new_input);
    images_count = $('.edit__item__images__image').length;
    dpboxSize(images_count);
    // 一番上のインプットだけ押せるように表示。
    $(input_area).children(":last").css({'display':'block'});
    // 選択したインプットの見た目を消す。
    $(this).css({'display':'none'});
    count += 1;
    });

// 新しく投稿した画像の削除ボタン（完成）
  $('body').on('click', ".upload-item__images__btns__delete",  function(e) {
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
          $('#post__img__last,#post__img').attr({
            'data-image': 0
          });
          $('#item__img__prev').attr({
            'data-image': 0
          });
        }
      }
    })
    images_count = $('.edit__item__images__image').length;
    dpboxSize(images_count);
  });

// もともとあるアイテムに対しての削除ボタン
  $('.edit__item__images__btns__delete').click(function(e){
    e.preventDefault();
    id = $(this).data("id")
    var delete_image = $(".hidden.delete__image__box").find(`#item_item_images_attributes_${id}__destroy`)
    delete_image.prop('value', "1");
    $(this).parent().parent().hide();
    $(this).parent().parent().appendTo(".delete__image__box");

//dpboxSizeのために消す
    var deleteimg = $(this).parent().parent().find('img');
    deleteimg.remove();
    images_count = $('.edit__item__images__image').length;
    dpboxSize(images_count);
  });
});
