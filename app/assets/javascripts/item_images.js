
$(function() {
  var images = [];
  var images_length = images.length
  var inputs  =[];
  var input_area = $('.upload__box');
  var images_count=$('.edit-item__images__image').length;

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

  function dpboxSize(images_count ) {
    switch( images_count ) {
      case 1:
      case 6:
      case 11:
          console.log(images_count);
          $('.upload__box').css({'width':'600px','margin-left': '10px'});
          break;
      case 2:
      case 7:
          console.log(images_count);
          $('.upload__box').css({'width':'480px','margin-left': '10px'});
          break;
      case 3:
      case 8:
          console.log(images_count);
          $('.upload__box').css({'width':'350px','margin-left': '10px'});
          break;
      case 4:
      case 9:
          console.log(images_count);
          $('.upload__box').css({'width':'240px','margin-left': '10px'});
          break;
      case 5:
      case 10:
          console.log(images_count);
          $('.upload__box').css({'width':'110px','margin-left': '10px'});
          break;
    }
  }



  $(document).on('change', '#post_img',function(event) {
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
    if(images_count < 5){
      $('.sell__dropbox__box__inner__nonaka').append(html);
    }else{
      $('.sell__dropbox__box__inner__nonaka2').append(html);
    }
    // $(input_area ).before(html);
    images.push(html);
    // console.log(images.length,inputs.length)
    var new_input = $(`<input multiple= "multiple" name="item[item_images_attributes][][image]" class="sell__upload__drop-file" data-image= ${images.length} type="file" id="post_img" accept="image/*">`);
    input_area.prepend(new_input);
    images_count = $('.edit-item__images__image').length;
    // console.log(images_count,"アイテムの数")
    dpboxSize(images_count)
  });


// 配列の確認用
  $('.l__single__head').click(function(){
    console.log(images.length,inputs.length)
  });



// 削除ボタン（完成）
  $('body').on('click', ".edit-item__images__btns__delete",  function(e) {
    e.preventDefault();
    var target = $(this).parent().parent();
    var target_image= target.find('img');
    // console.log(inputs,images)
    $.each(inputs, function(index, input){
      if ($(input).data('image') == target_image.data('image')){
        $(input).remove();
        target.remove();
        images.splice(index, 1);
        inputs.splice(index, 1);
        if(inputs.length == 0) {
          $('#post_img').attr({
            'data-image': 0
          })
          $('#avatar_img_prev').attr({
            'data-image': 0
          })
        }
      }
    })
    images_count = $('.edit-item__images__image').length;
    dpboxSize(images_count)
  });
// もともとあるアイテムに対しての削除ボタン（未完成）
  $('.motomoto_btn').click(function(e){
    e.preventDefault();
    var inputId = $(this).data('id');
    $(this).prev().prop('value', true);
    $(this).parent().parent().hide();
    var deleteimg = $(this).parent().parent().find('img');
    deleteimg.remove();
    images_count = $('.edit-item__images__image').length;
    dpboxSize(images_count)
  });


  // upload__boxのサイズ変更
  $('.sell__dropbox__box__inner').change(function(){
  });
});