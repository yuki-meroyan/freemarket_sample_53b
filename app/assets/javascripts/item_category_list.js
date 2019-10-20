
$(function(){
  $('#nav-category').mouseover(function (e) {
    $('.nav__category__parent').css('display', 'flex');    
  });

  $('#nav-category').mouseout(function () {
    $('.nav__category__parent').css('display', 'none');
  });

  $('.parent-list').mouseover(function() {
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
            var insertHTML = `<div class="child-list" data-category-id=${child.id}>
                                <li>${child.category}</li>
                              </div>`
            $('.nav__category__child__list').append(insertHTML);
          });          
        } 
    })

    $('.child-list').mouseout(function () {
      $('.nav__category__child').css('display', 'none');
    });

    // $('.child-list').mouseover(function() {
    //   $(this).css('background-color', 'red');
    //   $('.nav__category__grandchild').css('display', 'flex'); 
    //   var parent_id = $(this).data('category-id');
    //   $.ajax({
    //     type: 'GET',
    //     url: `/categories`,
    //     data: {target_id: parent_id, keyword: "child"},
    //     dataType: 'json'
    //   })
    //   .done(function(grandchilds) {
    //     $('.nav__category__grandchild').empty();
    //       if (grandchilds.length !== 0) {
    //         var insertHTML = "";
    //         childs.forEach(function(grandchild){
    //           console.log(grandchild);
    //           var insertHTML = `<div class="grandchild-list" data-category-id=${grandchild.id}>
    //                               <li>${grandchild.category}</li>
    //                             </div>`
    //           $('.nav__category__grandchild').append(insertHTML);
    //         });          
    //       } 
    //   })
  });

  $('.parent-list').mouseout(function() {
    $(this).css('background-color', 'white');
  });
});