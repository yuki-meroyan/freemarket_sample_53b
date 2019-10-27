$(function(){
  $('#nav-category').on('mouseenter', function(){
    $('.nav__category__parent').css('display', 'flex'); 
    $.ajax({
      type: 'GET',
      url: `/categories`,
      data: {keyword: "parent"},
      dataType: 'json'
    })
    .done(function(parents) {
      $('.nav__category__parent__list').empty();
      if (parents.length !== 0) {
        var insertHTML = "";
        parents.forEach(function(parent){
          var insertHTML = `<div class="parent-list" data-category-id=${parent.id}>
                              <li>${parent.category}</li>
                            </div>`
          $('.nav__category__parent__list').append(insertHTML);
        });
      }
    })
    $(document).on('mouseenter', '.parent-list', function(){
      $(this).css('background-color', 'red');
      $('.nav__category__child').css('display', 'flex'); 
      var parent_id = $(this).data('category-id');
      $.ajax({
        type: 'GET',
        url: `/categories`,
        data: {target_id: parent_id, keyword: "child"},
        dataType: 'json'
      })
      .done(function(childs) {
        $('.nav__category__child__list').empty();
        if (childs.length !== 0) {
          var insertHTML = "";
          childs.forEach(function(child){
            console.log(child);
            var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id}>
                                <li>${child.category}</li>
                              </div>`
            $('.nav__category__child__list').append(insertHTML);
          });
        }
      })
    });

    $(document).on('mouseenter', '.child-list', function(){
      $(this).css('background-color', 'red');
      $('.nav__category__grandchild').css('display', 'flex'); 
      var child_id = $(this).data('category-id');
      console.log(child_id);
      $.ajax({
        type: 'GET',
        url: `/categories`,
        data: {target_id: child_id, keyword: "grandchild"},
        dataType: 'json'
      })
      .done(function(grandchilds) {
        $('.nav__category__grandchild__list').empty();
          if (grandchilds.length !== 0) {
            var insertHTML = "";
            grandchilds.forEach(function(grandchild){
              // console.log(grandchild);
              var insertHTML = `<div class="grandchild-list" data-category-id=${grandchild.id}>
                                  <li>${grandchild.category}</li>
                                </div>`
              $('.nav__category__grandchild__list').append(insertHTML);
            });          
          } 
      })
    });
    $(document).on('mouseout', '.parent-list', function(){
      $(this).css('background-color', 'white');
    });
    $(document).on('mouseout', '.child-list', function(){
      $(this).css('background-color', 'white');
    });
  });
//   $('#nav-category').hover(
//     function(e) {
//       // ……mouseenterイベントに対応する処理……
//       $('.nav__category__parent').css('display', 'flex'); 
      // $.ajax({
      //   type: 'GET',
      //   url: `/categories`,
      //   data: {keyword: "parent"},
      //   dataType: 'json'
      // })
      // .done(function(parents) {
      //   $('.nav__category__parent__list').empty();
      //   if (parents.length !== 0) {
      //     var insertHTML = "";
      //     parents.forEach(function(parent){
      //       var insertHTML = `<div class="parent-list" data-category-id=${parent.id}>
      //                           <li>${parent.category}</li>
      //                         </div>`
      //       $('.nav__category__parent__list').append(insertHTML);
      //     });
      //   }
      // })
//       $('.parent-list').hover(
//         function(e) {
//           // ……mouseenterイベントに対応する処理……
//             $(this).css('background-color', 'red');
//         },
//         function(e) {
//           // ……mouseleaveイベントに対応する処理……
//           $(this).css('background-color', 'white');
//         }
//       );
//     },
//   );

//   $(document).on('mouseover', '#nav-category', function(){
//     $('.nav__category__parent').css('display', 'flex'); 
//     $.ajax({
//       type: 'GET',
//       url: `/categories`,
//       data: {keyword: "parent"},
//       dataType: 'json'
//     })
//     .done(function(parents) {
//       $('.nav__category__parent__list').empty();
//       if (parents.length !== 0) {
//         var insertHTML = "";
//         parents.forEach(function(parent){
//           var insertHTML = `<div class="parent-list" data-category-id=${parent.id}>
//                               <li>${parent.category}</li>
//                             </div>`
//           $('.nav__category__parent__list').append(insertHTML);
//         });
//       }
//     })
//     $('.parent-list').hover(
//       function(e) {
//         // ……mouseenterイベントに対応する処理……
//           $(this).css('background-color', 'red');
//       },
//       function(e) {
//         // ……mouseleaveイベントに対応する処理……
//         $(this).css('background-color', 'white');
//       }
//     );
//   });

//   $('#nav-category').mouseover(function(e){
//     $('.nav__category__parent').css('display', 'flex'); 
//     $.ajax({
//       type: 'GET',
//       url: `/categories`,
//       data: {keyword: "parent"},
//       dataType: 'json'
//     })
//     .done(function(parents) {
//       $('.nav__category__parent__list').empty();
//       if (parents.length !== 0) {
//         var insertHTML = "";
//         parents.forEach(function(parent){
//           var insertHTML = `<div class="parent-list" data-category-id=${parent.id}>
//                               <li>${parent.category}</li>
//                             </div>`
//           $('.nav__category__parent__list').append(insertHTML);
//         });
//       }
//     })
//     $('.nav__category__parent').mouseover(function() {
//       $('.parent-list').mouseover(function(e) {
//         $(this).css('background-color', 'red');
//       })
//     });
//     $('.parent-list').mouseover(function() {
//       $(this).css('background-color', 'red');
      // $('.nav__category__child').css('display', 'flex'); 
      // var parent_id = $(this).data('category-id');
      // $.ajax({
      //   type: 'GET',
      //   url: `/categories`,
      //   data: {target_id: parent_id, keyword: "child"},
      //   dataType: 'json'
      // })
      // .done(function(childs) {
      //   $('.nav__category__child__list').empty();
      //   if (childs.length !== 0) {
      //     var insertHTML = "";
      //     childs.forEach(function(child){
      //       console.log(child);
      //       var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id}>
      //                           <li>${child.category}</li>
      //                         </div>`
      //       $('.nav__category__child__list').append(insertHTML);
      //     });
      //   }
//       })
//     });
//     $('.parent-list').mouseout(function() {
//       $(this).css('background-color', 'white');
//     });
//   })

//   $('.nav__category__parent').mouseover(function() {
//     $('.parent-list').mouseover(function(e) {
//       $(this).css('background-color', 'red');
//     })
//   });
//   $('.parent-list').mouseout(function() {
//     $(this).css('background-color', 'white');
//   });
//   $('#nav-category').mouseout(function () {
//     $('.nav__category__parent').css('display', 'none');
//   });
// });
//   $('#nav-category').mouseover(function (e) {
//     $('.nav__category__parent').css('display', 'flex');    
//   });


// $(function(){
//   $('#nav-category').mouseover(function (e) {
//     $('.nav__category__parent').css('display', 'flex');    
//   });

//   $('#nav-category').mouseout(function () {
//     $('.nav__category__parent').css('display', 'none');
//   });

//   $('.parent-list').mouseover(function() {
//     $(this).css('background-color', 'red');
//     $('.nav__category__child').css('display', 'flex'); 
//     var parent_id = $(this).data('category-id');
//     console.log(parent_id);
//     $.ajax({
//       type: 'GET',
//       url: `/categories`,
//       data: {target_id: parent_id, keyword: "child"},
//       dataType: 'json'
//     })
//     .done(function(childs) {
//       $('.nav__category__child__list').empty();
//       if (childs.length !== 0) {
//         var insertHTML = "";
//         childs.forEach(function(child){
//           // console.log(child);
//           var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id}>
//                               <li>${child.category}</li>
//                             </div>`
//           $('.nav__category__child__list').append(insertHTML);
//         });          
//       }
//     })
//   });
//   $('.parent-list').mouseout(function() {
//     $(this).css('background-color', 'white');
//   });

//   $('.child-list').mouseover(function() {
//     $(this).css('background-color', 'red');
//     $('.nav__category__grandchild').css('display', 'flex'); 
    // var child_id = $(this).data('category-id');
    // console.log(child_id);
    // $.ajax({
    //   type: 'GET',
    //   url: `/categories`,
    //   data: {target_id: child_id, keyword: "grandchild"},
    //   dataType: 'json'
    // })
    // .done(function(grandchilds) {
    //   $('.nav__category__grandchild').empty();
    //     if (grandchilds.length !== 0) {
    //       var insertHTML = "";
    //       grandchilds.forEach(function(grandchild){
    //         // console.log(grandchild);
    //         var insertHTML = `<div class="grandchild-list" data-category-id=${grandchild.id}>
    //                             <li>${grandchild.category}</li>
    //                           </div>`
    //         $('.nav__category__grandchild').append(insertHTML);
    //       });          
    //     } 
    // })
//   });
// $('.nav__category__child').mouseout(function () {
//   $('.nav__category__child__list').empty();
// });
});