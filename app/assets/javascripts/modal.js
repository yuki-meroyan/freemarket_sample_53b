$(function(){
  $('.item-delete').on('click',function(){
      $('.js-modal').fadeIn();
      $('body').css('overflow','hidden'
      );
      return false;
  });
  $('.js-modal-close').on('click',function(){
      $('.js-modal').fadeOut();
      $('body').css('overflow','visible'
      );
      return false;
  });
});


