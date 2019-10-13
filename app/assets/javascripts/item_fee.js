$(function(){
 function itemsPriceCalculation(){
    var price = $('#item_price').val();
    var salesFee = Math.floor(price / 10);
    var salesBenefit = price - salesFee;
    $('.sales-commission').text('¥' + String(salesFee).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
    $('.sales-profit').text('¥' + String(salesBenefit).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
  };

  $(window).on('load',function(){
    itemsPriceCalculation();
  });
  $('#item_price').on('keyup',function(){
    itemsPriceCalculation();
  });

});


