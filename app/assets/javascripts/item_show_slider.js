$(function(){
  var slider =$('.owl__carousel__inner')
  var button =$('.owl__dot')

  $(button).on('click',function(){
  var i = $(this).data('image') ;
  console.log(i);
  $(slider).animate({left:-300 * i + 'px'},
  500,'swing');
    });

});

