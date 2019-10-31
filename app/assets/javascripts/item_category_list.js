$(function(){

  var active_id = ""

  $('#nav-category').on('mouseenter', function(){
    var target_id = $(this).data('category-id');
    if (target_id != active_id) {
      $('.nav__category__parent__list').empty();
      $('.nav__category__child__list').empty();
      $('.nav__category__grandchild__list').empty();
      $('.nav__category__parent').css('display', 'flex'); 
      $.ajax({
        type: 'GET',
        url: `/categories`,
        data: {keyword: "parent"},
        dataType: 'json'
      })
      .done(function(parents) {
        if (parents.length !== 0) {
          var insertHTML = "";
          parents.forEach(function(parent){
            var insertHTML = `<div class="parent-list" data-category-id=${parent.id}>
                                <li>
                                  <a class="category__main__grandchild__link-name" href="/categories/${parent.id}">
                                    <p>${parent.category}</p>
                                  </a>
                                </li>
                              </div>`
            $('.nav__category__parent__list').append(insertHTML);
          });
        }
      })
    }

    $(document).on('mouseenter', '.parent-list', function(){
      console.log(active_id)
      $(this).css('background-color', 'red');
      $(this).css('color', 'white');
      $('.nav__category__child').css('display', 'flex'); 
      var parent_id = $(this).data('category-id');
      if (active_id != parent_id) {
        $.ajax({
          type: 'GET',
          url: `/categories`,
          data: {target_id: parent_id, keyword: "child"},
          dataType: 'json'
        })
        .done(function(childs) {
          $('.nav__category__child__list').empty();
          $('.nav__category__grandchild__list').empty();
          $('.nav__category__grandchild').css('display', 'none');
          if (childs.length !== 0) {
            var insertHTML = "";
            childs.forEach(function(child){
              var insertHTML = `<div class="child-list" data-category-id=${parent_id}/${child.id}>
                                  <li>
                                    <a class="category__main__grandchild__link-name" href="/categories/${child.id}">
                                      <p>${child.category}</p>
                                    </a>
                                  </li>
                                </div>`
              $('.nav__category__child__list').append(insertHTML);
            })
          }
          active_id = parent_id
        });
      }
      
      $('.parent-list').on('mouseleave', function(){
        $(this).css('background-color', 'white');
        $(this).css('color', 'black');
      });
    })

    $(document).on('mouseleave', '#nav-category', function(){
      $('.nav__category__parent__list').empty();
      $('.nav__category__child__list').empty();
      $('.nav__category__grandchild__list').empty();
    });

  });
      
      
      
      
        
        
          
          
            
 











  // var activeElement = ""
  // $('#nav-category').on('mouseenter', function(){
  //   if ($(this) != activeElement) {
  //     activeElement = $(this)
  //     $('.nav__category__parent__list').empty();
  //     $('.nav__category__child__list').empty();
  //     $('.nav__category__grandchild__list').empty();
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
  //         parents.forEach(function(parent){
  //           var insertHTML = `<div class="parent-list" data-category-id=${parent.id}>
  //                               <li>
  //                                 <a class="category__main__grandchild__link-name" href="/categories/${parent.id}">
  //                                   <p>${parent.category}</p>
  //                                 </a>
  //                               </li>
  //                             </div>`
  //           $('.nav__category__parent__list').append(insertHTML);
  //         });
  //       }
  //     })
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
      //     $(document).on('mouseleave', '.parent-list', function(){
      //       $(this).css('background-color', 'white');
      //       $(this).css('color', 'black');
      //     });
      //   })

  //       $(document).on('mouseleave', '.child-list', function(){
  //         $(this).css('background-color', 'white');
  //       });

  //     $(document).on('mouseenter', '.child-list', function(){
  //       $(this).css('background-color', 'gray');
  //       $('.nav__category__grandchild').css('display', 'flex'); 
  //       var child_id = $(this).data('category-id');
  //       $.ajax({
  //         type: 'GET',
  //         url: `/categories`,
  //         data: {target_id: child_id, keyword: "grandchild"},
  //         dataType: 'json'
  //       })
  //       .done(function(grandchilds) {
  //         $('.nav__category__grandchild__list').empty();
  //           if (grandchilds.length !== 0) {
  //             var insertHTML = "";
  //             grandchilds.forEach(function(grandchild){
  //               var insertHTML = `<div class="grandchild-list" data-category-id=${grandchild.id}>
  //                                   <li>
  //                                     <a class="category__main__grandchild__link-name" href="/categories/${grandchild.id}">
  //                                       <p>${grandchild.category}</p>
  //                                     </a>
  //                                   </li>
  //                                 </div>`
  //               $('.nav__category__grandchild__list').append(insertHTML);
  //             });
  //           } 
  //       })
  //       $(document).on('mouseenter', '.grandchild-list', function(){
  //         $(this).css('background-color', 'gray');
  //       });
  //       $(document).on('mouseleave', '.grandchild-list', function(){
  //         $(this).css('background-color', 'white');
  //       });
  //     });
  //   });
  //     $(document).on('mouseleave', '#nav-category', function(){
  //       $('.nav__category__parent__list').empty();
  //       $('.nav__category__child__list').empty();
  //       $('.nav__category__child').css('display', 'none');
  //       $('.nav__category__grandchild__list').empty();
  //       $('.nav__category__grandchild').css('display', 'none');
  //     });
  //   }
  // });
});