
$(function(){
  $(document).ready(function(){
    $.ajax({
      type: 'GET',
      url: `/categories`,
      data: {keyword: "all"},
      dataType: 'json'
    })
    .done(function(categories) {
      var parentLists = $.grep(categories,
        function(category, index) {
          return (category.ancestry == null );
        }
      );  //--- grepの終わり
      $(document).on('mouseenter', '#nav-category', function(){
        $('.nav__category__parent').css('display', 'flex'); 
        if (parentLists.length !== 0) {
          var insertHTML = "";
          $('.nav__category__parent__list').empty();
          $('.nav__category__child__list').empty();
          $('.nav__category__child').css('display', 'none'); 
          $('.nav__category__grandchild__list').empty();
          $('.nav__category__grandchild').css('display', 'none'); 
          parentLists.forEach(function(parent){
            var insertHTML = `<div class="parent-list" data-category-id=${parent.id} data-position="parent">
                                <li>
                                  <a class="category__main__grandchild__link-name" href="/categories/${parent.id}">
                                    <p>${parent.category}</p>
                                  </a>
                                </li>
                                </div>`
            $('.nav__category__parent__list').append(insertHTML);

          });   //--- parentLists.forEach の終わり
        }       //--- if parentLists.length !== 0 の終わり
      });       //--- mouseenter/nav-category の終わり

      $(document).on('mouseenter', '.parent-list', function(){
        $(this).css('background-color', 'red');
        $(this).css('color', 'white');
        console.log(parent_id + '/' + $(this).data('category-id'))
        if (parent_id != $(this).data('category-id') ) {
          
        }
        var parent_id = $(this).data('category-id');
        var childLists = $.grep(categories,
          function(category, index) {
            return (category.ancestry == parent_id);
          }
        );
        if (childLists.length !== 0) {
          var insertHTML = "";
          $('.nav__category__child').css('display', 'flex'); 
          $('.nav__category__child__list').empty();
          $('.nav__category__grandchild__list').empty();
          $('.nav__category__grandchild').css('display', 'none');
          childLists.forEach(function(child){
            var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id} data-position="child">
                                <li>
                                  <a class="category__main__grandchild__link-name" href="/categories/${child.id}">
                                    <p>${child.category}</p>
                                  </a>
                                </li>
                              </div>`
            $('.nav__category__child__list').append(insertHTML);
          });   //--- childs.forEachの終わり
        }       //--- if childs.length !== 0 の終わり

        $('#nav-category').on('mouseleave', function(){
          $('.nav__category__parent__list').empty();
          $('.nav__category__parent').css('display', 'none'); 
          $('.nav__category__child__list').empty();
          $('.nav__category__grandchild__list').empty();
        })      //--- hoverの終わり

      });       //--- mouseenter/parent-list の終わり

      $(document).on('mouseenter', '.child-list', function(){
        $(this).css('background-color', 'gray');
        $(this).css('color', 'black');
        // if (child_id != $(this).data('category-id') ) {
        //   $(this).css('background-color', 'white');
        //   $(this).css('color', 'black');
        // }
        var child_id = $(this).data('category-id');
        var grandchildLists = $.grep(categories,
          function(category, index) {
            return (category.ancestry == child_id);
          }
        );
        if (grandchildLists.length !== 0) {
          var insertHTML = "";
          $('.nav__category__grandchild').css('display', 'flex'); 
          $('.nav__category__grandchild__list').empty();
          grandchildLists.forEach(function(grandchild){
            var insertHTML = `<div class="grandchild-list" data-category-id=${grandchild.id} data-position="grandchild">
                                <li>
                                  <a class="category__main__grandchild__link-name" href="/categories/${grandchild.id}">
                                    <p>${grandchild.category}</p>
                                  </a>
                                </li>
                              </div>`
            $('.nav__category__grandchild__list').append(insertHTML);
          });     //--- grandchilds.forEachの終わり
        }         //--- if grandchilds.length !== 0 の終わり
      })          //--- mouseenter/child-list の終わり

      $(document).on('mouseenter', '.grandchild-list', function(){
        $(this).css('background-color', 'gray');
        $(this).css('color', 'black');
      })          //--- mouseenter/grandchild-list の終わり
      
      $(document).on('mouseleave', '.parent-list', function(){
        $(this).css('background-color', 'white');
        $(this).css('color', 'black');
        // $('.nav__category__child__list').empty();
        // $('.nav__category__child').css('display', 'none'); 
      })

    });
  });               //--- readyの終わり
});                 //--- functionの終わり








// $(function(){

//   var parent_id = ""
//   var child_id = ""
//   var grandchild_id = ""

//   function ajaxParent(id, keyword ) {

//   }

//   $('#nav-category').hover(function() {
//     $('.nav__category__parent').css('display', 'flex'); 
    
//     $.ajax({
//       type: 'GET',
//       url: `/categories`,
//       data: {keyword: "parent"},
//       dataType: 'json'
//     })
//     .done(function(parents) {
//       if (parents.length !== 0) {
//         var insertHTML = "";
//         $('.nav__category__parent__list').empty();
//         // $('.nav__category__child__list').empty();
//         // $('.nav__category__grandchild__list').empty();
//         parents.forEach(function(parent){
//           var insertHTML = `<div class="parent-list" data-category-id=${parent.id}>
//                               <li>
//                                 <a class="category__main__grandchild__link-name" href="/categories/${parent.id}">
//                                   <p>${parent.category}</p>
//                                 </a>
//                               </li>
//                               </div>`
//           $('.nav__category__parent__list').append(insertHTML);
//         });
//       }
//     })
//     $(document).on('mouseenter', '.parent-list', function(){
//       var parent_id = $(this).data('category-id');
//       $.ajax({
//         type: 'GET',
//         url: `/categories`,
//         data: {target_id: parent_id, keyword: "child"},
//         dataType: 'json'
//       })
//       .done(function(childs) {
//         if (childs.length !== 0) {
//           var insertHTML = "";
//           $('.nav__category__child').css('display', 'flex'); 
//           // $('.nav__category__child__list').empty();
//           $('.nav__category__grandchild__list').empty();
//           $('.nav__category__grandchild').css('display', 'none');
//           childs.forEach(function(child){
//             var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id}>
//                                 <li>
//                                   <a class="category__main__grandchild__link-name" href="/categories/${child.id}">
//                                     <p>${child.category}</p>
//                                   </a>
//                                 </li>
//                               </div>`
//             $('.nav__category__child__list').append(insertHTML);
//           });
//         }
//       })
//     $(document).on('mouseenter', '.child-list', function(){
//       var child_id = $(this).data('category-id');
//       $.ajax({
//         type: 'GET',
//         url: `/categories`,
//         data: {target_id: child_id, keyword: "grandchild"},
//         dataType: 'json'
//       })
//       .done(function(grandchilds) {
//         if (grandchilds.length !== 0) {
//           var insertHTML = "";
//           $('.nav__category__grandchild').css('display', 'flex'); 
//           $('.nav__category__grandchild__list').empty();
//           grandchilds.forEach(function(grandchild){
//             var insertHTML = `<div class="grandchild-list" data-category-id=${grandchild.id}>
//                                 <li>
//                                   <a class="category__main__grandchild__link-name" href="/categories/${grandchild.id}">
//                                     <p>${grandchild.category}</p>
//                                   </a>
//                                 </li>
//                               </div>`
//             $('.nav__category__grandchild__list').append(insertHTML);
//           });
//         } 
//       })
//     });
//   });
//   }, function() {
//     // $(document).on('mouseleave', '#nav-category', function(){
//       $('.nav__category__parent__list').empty();
//       $('.nav__category__child__list').empty();
//       $('.nav__category__grandchild__list').empty();
//       $('.nav__category__parent').css('display', 'none'); 
//     // });
//   })
// });





    //   $(this).css('background-color', 'red');
    //   $(this).css('color', 'white');
    // $('.nav__category__child').css('display', 'flex'); 
    // var parent_id = $(this).data('category-id');
    //   $.ajax({
    //     type: 'GET',
    //     url: `/categories`,
    //     data: {target_id: parent_id, keyword: "child"},
    //     dataType: 'json'
    //   })
    //   .done(function(childs) {
    //     $('.nav__category__child__list').empty();
    //     $('.nav__category__grandchild__list').empty();
    //     $('.nav__category__grandchild').css('display', 'none');
    //     if (childs.length !== 0) {
    //       var insertHTML = "";
    //       childs.forEach(function(child){
    //         var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id}>
    //                             <li>
    //                               <a class="category__main__grandchild__link-name" href="/categories/${child.id}">
    //                                 <p>${child.category}</p>
    //                               </a>
    //                             </li>
    //                           </div>`
    //         $('.nav__category__child__list').append(insertHTML);
    //       });
    //     }
    //   })
    //   $(document).on('mouseleave', '.parent-list', function(){
    //     $(this).css('background-color', 'white');
    //     $(this).css('color', 'black');
    //   });
    // }), function(){
    //   $(":hover").each(function(){
    //     console.log($(this))
    //   });
    //   $(this).css('background-color', 'white');
    //   $(this).css('color', 'black');
    // }
  
//   $('#nav-category').on('mouseenter', function(){
      // $('.nav__category__parent__list').empty();
      // $('.nav__category__child__list').empty();
      // $('.nav__category__grandchild__list').empty();
      // $('.nav__category__parent').css('display', 'flex'); 
      // $.ajax({
      //   type: 'GET',
      //   url: `/categories`,
      //   data: {keyword: "parent"},
      //   dataType: 'json'
      // })
      // .done(function(parents) {
      //   if (parents.length !== 0) {
      //     var insertHTML = "";
      //     parents.forEach(function(parent){
      //       var insertHTML = `<div class="parent-list" data-category-id=${parent.id}>
      //                           <li>
      //                             <a class="category__main__grandchild__link-name" href="/categories/${parent.id}">
      //                               <p>${parent.category}</p>
      //                             </a>
      //                           </li>
      //                         </div>`
      //       $('.nav__category__parent__list').append(insertHTML);
      //     });
      //   }
      // })
      // $(document).on('mouseenter', '.parent-list', function(){
      //   $(this).css('background-color', 'red');
      //   $(this).css('color', 'white');
      //   $('.nav__category__child').css('display', 'flex'); 
      //   var parent_id = $(this).data('category-id');
      //   $.ajax({
      //     type: 'GET',
      //     url: `/categories`,
      //     data: {target_id: parent_id, keyword: "child"},
      //     dataType: 'json'
      //   })
      //   .done(function(childs) {
      //     $('.nav__category__child__list').empty();
      //     $('.nav__category__grandchild__list').empty();
      //     $('.nav__category__grandchild').css('display', 'none');
      //     if (childs.length !== 0) {
      //       var insertHTML = "";
      //       childs.forEach(function(child){
      //         var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id}>
      //                             <li>
      //                               <a class="category__main__grandchild__link-name" href="/categories/${child.id}">
      //                                 <p>${child.category}</p>
      //                               </a>
      //                             </li>
      //                           </div>`
      //         $('.nav__category__child__list').append(insertHTML);
      //       });
      //     }
//           $(document).on('mouseleave', '.parent-list', function(){
            // $(this).css('background-color', 'white');
            // $(this).css('color', 'black');
//           });
//         })

//         $(document).on('mouseleave', '.child-list', function(){
//           $(this).css('background-color', 'white');
//         });

//       $(document).on('mouseenter', '.child-list', function(){
//         $(this).css('background-color', 'gray');
//         $('.nav__category__grandchild').css('display', 'flex'); 
//         var child_id = $(this).data('category-id');
//         $.ajax({
//           type: 'GET',
//           url: `/categories`,
//           data: {target_id: child_id, keyword: "grandchild"},
//           dataType: 'json'
//         })
//         .done(function(grandchilds) {
//           $('.nav__category__grandchild__list').empty();
//             if (grandchilds.length !== 0) {
//               var insertHTML = "";
//               grandchilds.forEach(function(grandchild){
//                 var insertHTML = `<div class="grandchild-list" data-category-id=${grandchild.id}>
//                                     <li>
//                                       <a class="category__main__grandchild__link-name" href="/categories/${grandchild.id}">
//                                         <p>${grandchild.category}</p>
//                                       </a>
//                                     </li>
//                                   </div>`
//                 $('.nav__category__grandchild__list').append(insertHTML);
//               });
//             } 
//         })
//         $(document).on('mouseenter', '.grandchild-list', function(){
//           $(this).css('background-color', 'gray');
//         });
//         $(document).on('mouseleave', '.grandchild-list', function(){
//           $(this).css('background-color', 'white');
//         });
//       });
//     });
//       $(document).on('mouseleave', '#nav-category', function(){
//         $('.nav__category__parent__list').empty();
//         $('.nav__category__child__list').empty();
//         $('.nav__category__child').css('display', 'none');
//         $('.nav__category__grandchild__list').empty();
//         $('.nav__category__grandchild').css('display', 'none');
//       });
//   });
// });

//   var parent_id = ""
//   var child_id = ""
//   var grandchild_id = ""

  // $('#nav-category').on('mouseenter', function(){
  //   $('.nav__category__parent__list').empty();
  //   $('.nav__category__child__list').empty();
  //   $('.nav__category__grandchild__list').empty();
  //   $('.nav__category__parent').css('display', 'flex'); 
  //   $.ajax({
  //     type: 'GET',
  //     url: `/categories`,
  //     data: {keyword: "parent"},
  //     dataType: 'json'
  //   })
  //   .done(function(parents) {
  //     if (parents.length !== 0) {
  //       var insertHTML = "";
  //       parents.forEach(function(parent){
  //         var insertHTML = `<div class="parent-list listNo-${parent.id}" data-category-id=${parent.id}>
  //                             <li>
  //                               <a class="category__main__grandchild__link-name" href="/categories/${parent.id}">
  //                                 <p>${parent.category}</p>
  //                               </a>
  //                             </li>
  //                           </div>`
  //         $('.nav__category__parent__list').append(insertHTML);
  //       });
  //     }
  //   })

  //   $(document).on('mouseenter', '.parent-list', function(){
  //     $(this).css('background-color', 'red');
  //     $(this).css('color', 'white');
  //     $('.nav__category__child').css('display', 'flex'); 
  //     var parent_id = $(this).data('category-id');
  //     if (active_id != parent_id) {
  //       $.ajax({
  //         type: 'GET',
  //         url: `/categories`,
  //         data: {target_id: parent_id, keyword: "child"},
  //         dataType: 'json'
  //       })
  //       .done(function(childs) {
  //         $('.nav__category__child__list').empty();
  //         $('.nav__category__grandchild__list').empty();
  //         $('.nav__category__grandchild').css('display', 'none');
  //         if (childs.length !== 0) {
  //           var insertHTML = "";
  //           childs.forEach(function(child){
  //             var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id}>
  //                                 <li>
  //                                   <a class="category__main__grandchild__link-name" href="/categories/${child.id}">
  //                                     <p>${child.category}</p>
  //                                   </a>
  //                                 </li>
  //                               </div>`
  //             $('.nav__category__child__list').append(insertHTML);
  //           })
  //         }
  //         active_id = parent_id
  //       });
  //     }
  //   })

  //   $(document).on('mouseleave', function(){
  //     $(this).css('background-color', 'white');
  //     $(this).css('color', 'black');
  //   });
    // $(document).on('mouseleave', '#nav-category', function(){
    //   $('.nav__category__parent__list').empty();
    //   $('.nav__category__child__list').empty();
    //   $('.nav__category__grandchild__list').empty();
    //   $('.nav__category__parent').css('display', 'flex'); 
    // });
  // });
  
  
  
// });
    // $(document).on('mouseenter', '.parent-list', function(){
    //   $(this).css('background-color', 'red');
    //   $(this).css('color', 'white');
    //   $('.nav__category__child').css('display', 'flex'); 
    //   var parent_id = $(this).data('category-id');
    //   if (active_id != parent_id) {
    //     $.ajax({
    //       type: 'GET',
    //       url: `/categories`,
    //       data: {target_id: parent_id, keyword: "child"},
    //       dataType: 'json'
    //     })
    //     .done(function(childs) {
    //       $('.nav__category__child__list').empty();
    //       $('.nav__category__grandchild__list').empty();
    //       $('.nav__category__grandchild').css('display', 'none');
    //       if (childs.length !== 0) {
    //         var insertHTML = "";
    //         childs.forEach(function(child){
    //           var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id}>
    //                               <li>
    //                                 <a class="category__main__grandchild__link-name" href="/categories/${child.id}">
    //                                   <p>${child.category}</p>
    //                                 </a>
    //                               </li>
    //                             </div>`
    //           $('.nav__category__child__list').append(insertHTML);
    //         })
    //       }
    //       active_id = parent_id
    //     });
    //   }
    // })
    // $('.parent-list').on('mouseleave', function(){
    //   $(this).css('background-color', 'white');
    //   $(this).css('color', 'black');
    // });

  // $(".contents").on("mouseover", ".article", function(){
  //   $(this).css({"background-color": "#F1940B", "font-weight": "bold"});
  // }).on("mouseout", ".article", function(){
  //   $(this).css({"background-color": "#FFFFFF", "font-weight": "normal"});
  // })


  // var activeElement = ""
//   $('#nav-category').on('mouseenter', function(){
//     if ($(this) != activeElement) {
//       activeElement = $(this)
//       $('.nav__category__parent__list').empty();
//       $('.nav__category__child__list').empty();
//       $('.nav__category__grandchild__list').empty();
//       $('.nav__category__parent').css('display', 'flex'); 
//       $.ajax({
//         type: 'GET',
//         url: `/categories`,
//         data: {keyword: "parent"},
//         dataType: 'json'
//       })
//       .done(function(parents) {
//         if (parents.length !== 0) {
//           var insertHTML = "";
//           parents.forEach(function(parent){
//             var insertHTML = `<div class="parent-list" data-category-id=${parent.id}>
//                                 <li>
//                                   <a class="category__main__grandchild__link-name" href="/categories/${parent.id}">
//                                     <p>${parent.category}</p>
//                                   </a>
//                                 </li>
//                               </div>`
//             $('.nav__category__parent__list').append(insertHTML);
//           });
//         }
//       })
//       $(document).on('mouseenter', '.parent-list', function(){
//         $(this).css('background-color', 'red');
//         $(this).css('color', 'white');
//         $('.nav__category__child').css('display', 'flex'); 
//         var parent_id = $(this).data('category-id');
//         $.ajax({
//           type: 'GET',
//           url: `/categories`,
//           data: {target_id: parent_id, keyword: "child"},
//           dataType: 'json'
//         })
//         .done(function(childs) {
//           $('.nav__category__child__list').empty();
//           $('.nav__category__grandchild__list').empty();
//           $('.nav__category__grandchild').css('display', 'none');
//           if (childs.length !== 0) {
//             var insertHTML = "";
//             childs.forEach(function(child){
//               var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id}>
//                                   <li>
//                                     <a class="category__main__grandchild__link-name" href="/categories/${child.id}">
//                                       <p>${child.category}</p>
//                                     </a>
//                                   </li>
//                                 </div>`
//               $('.nav__category__child__list').append(insertHTML);
//             });
//           }
//           $(document).on('mouseleave', '.parent-list', function(){
//             $(this).css('background-color', 'white');
//             $(this).css('color', 'black');
//           });
//         })

//         $(document).on('mouseleave', '.child-list', function(){
//           $(this).css('background-color', 'white');
//         });

//       $(document).on('mouseenter', '.child-list', function(){
//         $(this).css('background-color', 'gray');
//         $('.nav__category__grandchild').css('display', 'flex'); 
//         var child_id = $(this).data('category-id');
//         $.ajax({
//           type: 'GET',
//           url: `/categories`,
//           data: {target_id: child_id, keyword: "grandchild"},
//           dataType: 'json'
//         })
//         .done(function(grandchilds) {
//           $('.nav__category__grandchild__list').empty();
//             if (grandchilds.length !== 0) {
//               var insertHTML = "";
//               grandchilds.forEach(function(grandchild){
//                 var insertHTML = `<div class="grandchild-list" data-category-id=${grandchild.id}>
//                                     <li>
//                                       <a class="category__main__grandchild__link-name" href="/categories/${grandchild.id}">
//                                         <p>${grandchild.category}</p>
//                                       </a>
//                                     </li>
//                                   </div>`
//                 $('.nav__category__grandchild__list').append(insertHTML);
//               });
//             } 
//         })
//         $(document).on('mouseenter', '.grandchild-list', function(){
//           $(this).css('background-color', 'gray');
//         });
//         $(document).on('mouseleave', '.grandchild-list', function(){
//           $(this).css('background-color', 'white');
//         });
//       });
//     });
//       $(document).on('mouseleave', '#nav-category', function(){
//         $('.nav__category__parent__list').empty();
//         $('.nav__category__child__list').empty();
//         $('.nav__category__child').css('display', 'none');
//         $('.nav__category__grandchild__list').empty();
//         $('.nav__category__grandchild').css('display', 'none');
//       });
//     }
//   });
// });