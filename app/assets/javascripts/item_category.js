$(function () {
  // dataでカテゴリーの自身、親、親の親のidを送っているので変数に入れる
  grandparent = $("#category__box__grandchild").data('grandparent')
  parent      = $("#category__box__grandchild").data('parent')
  main        = $("#category__box__grandchild").data('main')

  var childChangeSelect = function (id, nextSelect) {
    var item_id = $('.sell__upload__head').data('item-id');
    $.ajax({
      type: 'GET',
      url: `/items/${item_id}/edit`,
      data: {keyword: id},
      dataType: 'json'
    })
    .done(function (categories) {
      nextSelect.empty();
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

  var grandchildChangeSelect = function (id, nextSelect) {
    var item_id = $('.sell__upload__head').data('item-id');
    $.ajax({
      type: 'GET',
      url: `/pending/item_edit`,
      data: {keyword: id},
      dataType: 'json'
    })
    .done(function (categories) {
      $("#item_category_id").empty();
      $(categories).each(function (i,category) {
        $("#item_category_id").append(`
        <option value="${category.id}">${category.name}</option>
        `);
      });
    })
    .fail(function () {
      alert('カテゴリの取得に失敗しました');
    });
  }

// 隠されている親セレクトを表示。そのまま親のoptionを持ってくるajaxにつながる。
  var child_display =function (i) {
    var id = $(i).val();
    if (id === "") {
      $('#category__box__child').css('display', 'none');
      $('#category__box__grandchild').css('display', 'none');
      return;
    }
    $('#category__box__child').css('display', 'block');
    childChangeSelect(id, $('#category_2_category_2'));
  }
// 隠されているカテゴリーIDセレクトを表示。そのまま孫のoptionを持ってくるajaxにつながる。
  var grandchild_display =function (i) {
    var id = $(i).val();
    console.log(id)
    if (id === "") {
      $('#category__box__grandchild').css('display', 'none');
      return;
    }
    $('#category__box__grandchild').css('display', 'block');
    grandchildChangeSelect (id, '#item_category_id');
  }


  $(window).on("load", function(){
    if(document.URL.match(/edit/) && document.URL.match(/items/)) {
      $('.category__boxes').css({'display':'block'});
// 親の親の値をgrandparentで送られて来た値に
      $('#category_1_category_1').val(`${grandparent}`);
// 親の親の値が変わったらchild_displayを呼んで親のoptionを決める。
        child_display('#category_1_category_1');
// 上で決めた中からdataで送られてきた値と一致するものを選択する。(valは入っているがビューは入らない。)
      $('#category_2_category_2').val(`${parent}`);
// 上と同じ流れ
        grandchild_display("#category_2_category_2");
      $('#item_category_id').val(`${main}`);
    }
    $('#category_2_category_2').val(`${parent}`);
  });
// 親の親カエゴリーが変更した時の処理
  $('#category_1_category_1').change(function(){
    child_display(this);
  });
// 親カテゴリーが変更した時の処理
  $('#category_2_category_2').change(function(){
    grandchild_display(this);
  });


  // 実験用これなら動く
  // $(window).on("click", function(){
  //   $('#category_2_category_2').val(`${parent}`);
  //   $('#item_category_id').val(`${main}`);
  // });
});