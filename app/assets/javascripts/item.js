$(document).ready(function(){

  $(function(){
    $('#item_value_attributes_price').bind('keyup change',function(){
        var price = $(this).val();
        var fee = Math.floor(price * 0.1);
        var profit = price - fee;
      if (price > 300) {
        $('.sell-container-inner__sell-price-fee__right').html(fee);
        $('.sell-container-inner__sell-price-profit__right-calc').html(profit);
        $('.profit_form').val(profit);
      }else{
        $('.sell-container-inner__sell-price-fee__right').html("−");
        $('.sell-container-inner__sell-price-profit__right-calc').html("−");
        $('.profit_form').val("−");
      }
    });
  });
});
