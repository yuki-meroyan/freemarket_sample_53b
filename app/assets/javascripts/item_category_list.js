
$(function(){
  $('#nav-category').mouseover(function (e) {
    $('.nav__category__parent').css('display', 'flex');
  });

  $('#nav-category').mouseout(function () {
    $('.nav__category__parent').css('display', 'none');
  });

  $('.parent-list').mouseover(function() {
    $(this).css('background-color', 'red');
    var parent_id = $(this).data('category-id');
    console.log(parent_id);
    $.ajax({
      type: 'GET',
      url: `/categories`,
      data: {keyword: parent_id, type: "child"},
      dataType: 'json'
    })
    .done(function(childs) {
      console.log("★★★★★★★★★★");
      $.each(childs,function(index, child) {
      })
    })
  });

  $('.parent-list').mouseout(function() {
    $(this).css('background-color', 'white');
  });
});