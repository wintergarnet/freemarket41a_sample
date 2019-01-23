$(document).ready(function(){
  Payjp.setPublicKey('pk_test_e0bb20c2c0a7d7d036fb6cfd');

  $(function(){
    $('#token').on('click',function(e){
      e.preventDefault();

      const card = {
        number: document.getElementById('card-number').value,
        cvc: document.getElementById('cvv').value,
        exp_month: document.getElementById('exp-month').value,
        exp_year: document.getElementById('exp-year').value
      };

      Payjp.createToken(card, (status, response) => {
        if (status === 200) {

          var data = {
            card_token: response.id
          }
          $.ajax({
            type: 'GET',
            url: '/credits/acquire_token',
            data: data,
            dataType: 'json'
          })
          .done(function(data){
            $('.btn-field__former').css('display', 'none');
            $('.btn-field__latter').css('display', 'block');
            $('#credit_customer_id').val(data.id);
          })
          .fail(function(){
          alert('通信に失敗しました');
          })
        }else{
          alert('カード情報を取得できません');
        }
      });
    });

  })
}, false);
