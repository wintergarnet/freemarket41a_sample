$(document).ready(function(){
  $(function(){
    $('#item_parent_category_attributes_large_category').on('change',function(){
      console.log($(this).val());
      var params = $(location).attr("href").match(/\/users\/\d+\/items/);
      var url = params + "/set_midium_categories";
      console.log(url);
      $.ajax({
        type: 'GET',
        url: url,
        data: {
          category_id: $(this).val()
        }
      })
      .done(function(data){
        $('.midium_category').html(data)
      })
    });
  });
});
