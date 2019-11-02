// $(function () {
//   $(window).on("load", function(){
//     if(document.URL.match(/new/) && document.URL.match(/items/)) {
//   // dataでカテゴリーの自身、親、親の親のidを送っているので変数に入れる

//   var childChangeSelect = function (id, nextSelect) {
//     $.ajax({
//       type: 'GET',
//       url: `/pending/item_new`,
//       data: {keyword: id},
//       dataType: 'json'
//     })
//     .done(function (categories) {
//       $('#category_2_category_2').empty();
//       $('#category_2_category_2').append(`
//       <option value="">---</option>
//       `);
//       $(categories).each(function (i,category) {
//         $('#category_2_category_2').append(`
//         <option value="${category.id}">${category.name}</option>
//         `);
//       });
//       // // ここに書く事で孫要素と祖父要素のカテゴリーを一致させる
//       // grandchild_display("#category_2_category_2");
//     })
//     .fail(function () {
//       alert('カテゴリの取得に失敗しました');
//     });
//   }

//   var grandchildChangeSelect = function (id, nextSelect) {
//     var item_id = $('.sell__upload__head').data('item-id');
//     $.ajax({
//       type: 'GET',
//       url: `/pending/item_edit`,
//       data: {keyword: id},
//       dataType: 'json'
//     })
//     .done(function (categories) {
//       $("#item_category_id").empty();
//       $("#item_category_id").append(`
//       <option value="">---</option>
//       `);
//       $(categories).each(function (i,category) {
//         $("#item_category_id").append(`
//         <option value="${category.id}">${category.name}</option>
//         `);
//       });
//     })
//     .fail(function () {
//       alert('カテゴリの取得に失敗しました');
//     });
//   }

// // 隠されている親セレクトを表示。そのまま親のoptionを持ってくるajaxにつながる。
//   var child_display =function (i) {
//     var id = $(i).val();
//     if (id === "") {
//       $('#category__box__child').css('display', 'none');
//       $('#category__box__grandchild').css('display', 'none');
//       return;
//     }
//     $('#category__box__child').css('display', 'block');
//     childChangeSelect(id, $('#category_2_category_2'));
//   }
// // 隠されているカテゴリーIDセレクトを表示。そのまま孫のoptionを持ってくるajaxにつながる。
//   var grandchild_display =function (i) {
//     var id = $(i).val();
//     console.log(id)
//     if (id === "") {
//       $('#category__box__grandchild').css('display', 'none');
//       return;
//     }
//     $('#category__box__grandchild').css('display', 'block');
//     grandchildChangeSelect (id, '#item_category_id');
//   }

//   // 親の親カエゴリーが変更した時の処理
//   $('#category_1_category_1').change(function(){
//     child_display(this);
//   });
// // 親カテゴリーが変更した時の処理
//   $('#category_2_category_2').change(function(){
//     grandchild_display(this);
//   });


//   }
//   });

// });