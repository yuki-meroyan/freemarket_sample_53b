
$(function() {

  var search_list = $(".brand__candidate__box__inner");
  var selected_list = $(".item__brands");
　　//検索に合致するbrandを表示
  function appendList(brand) {
    var html =  `<li id="${ brand.id}"  class="brand__candidate" data-brand-id="${ brand.id}" data-brand-name="${ brand.name }">${ brand.name }</li>`
    search_list.append(html)
  }

//追加ボタンが押されたときの処理
  $(function () {
    $(document).on("click", '.brand__candidate', function () {
        var name = $(this).attr("data-brand-name");
        var brand_id = $(this).attr("data-brand-id");
        $(this).siblings().remove();
        $(this).remove();
        $("#item-brand_id__input").val(name);
        $("#item_brand_id").val(brand_id);
    });
  });

  $("#item-brand_id__input").on("keyup paste", function() {
    var input = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/items',
      data: { keyword: input},
      dataType: 'json'
    })

    .done(function(brands,brand_lat) {
      $(search_list).empty()
      if (input.length !== 0){
        if(brands.length !== 0) {
          //brand検索し、合致するbrandを表示。後にグループに追加するbrandを選択する際に使うidにbrand.idを指定
          $.each(brands, function(i, brand) {
            appendList(brand);
          })
        }
      }  else  {
      $(search_list).empty();
      }
    })

    .fail(function() {
      alert('ブランド検索に失敗しました');
    })
  });
});