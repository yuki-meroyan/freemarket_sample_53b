$(function () {

  var changeSelect = function (id, nextSelect) {
    var item_id = $('.sell__upload__head').data('item-id');
    $.ajax({
      type: 'GET',
      url: `/items/${item_id}/edit`,
      data: {keyword: id},
      dataType: 'json'
    })
    .done(function (categories) {
      nextSelect.empty();
      nextSelect.append(`
        <option value="">---</option>
        `);
      $(categories).each(function (i,category) {
        nextSelect.append(`
        <option value="${category.id}">${category.name}</option>
        `);
      });
    })
    .fail(function () {
      alert('カテゴリの取得に失敗しました');
    });
  }

  $('.item__f-select').prepend(`
    <option value="" >---</option>
    `).val("");

  $('#category_1_category_1').change(function(){
    var id = $(this).val();
    if (id === "") {
      $('.category__box__child').css('display', 'none');
      $('.category__box__grandchild').css('display', 'none');
      return;
    }
    $('.category__box__child').css('display', 'block');
    changeSelect(id, $('#category_2_category_2'));
  });

  $('#category_2_category_2').change(function(){
    var id = $(this).val();
    if (id === "") {
      $('.category__box__grandchild').css('display', 'none');
      return;
    }
    $('.category__box__grandchild').css('display', 'block');
    changeSelect(id, $('#item_category_id'));
  });

});