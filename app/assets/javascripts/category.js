$(document).ready(function(){
  $(function(){
    $('#item_parent_category_attributes_large_category').on('change', function(){
      var params = $(location).attr("href").match(/\/users\/\d+\/items/);
      var url = `${params}/set_midium_categories`;
      var data = {
        category_id: $(this).val()
      };
      $.ajax({
        type: 'GET',
        url: url,
        data: data,
        dataType: 'json'
      })
      .done(function(data){
        $('.midium_category').html(`
        <div class='select-wrapper'>
          <select class="select-form" name="item[parent_category_attributes][midium_category]" id="item_parent_category_attributes_midium_category"><option value="">---</option>
          </select>
          <i class="fa fa-angle-down icon"></i>
        </div>`);

        $.each(data, function (i, val) {
        	$('#item_parent_category_attributes_midium_category').append($("<option>").val(val.id).text(val.name));
        });
      })
    });
  });
});
