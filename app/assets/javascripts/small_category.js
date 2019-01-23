$(document).ready(function(){
  $(function(){
    $('.midium_category').on('change', function(){
      var url = '/items/set_small_category';
      var midium_category_id = $('#item_parent_category_attributes_midium_category').val();
      var data = {
        category_id: midium_category_id
      };
      $.ajax({
        type: 'GET',
        url: url,
        data: data,
        dataType: 'json'
      })
      .done(function(data){
        $('.small_category').html(`
        <div class='select-wrapper'>
          <select class="select-form" name="item[parent_category_attributes][small_category]" id="item_parent_category_attributes_small_category"><option value="">---</option>
          </select>
          <i class="fa fa-angle-down icon"></i>
        </div>`);

        $.each(data, function (i, val) {
        	$('#item_parent_category_attributes_small_category').append($("<option>").val(val.id).text(val.name));
        });
      })
    });
    $('.search-midium_category').on('change', function(){
      var url = '/items/set_small_category';
      var midium_category_id = $('#item_parent_category_midium_category').val();
      var data = {
        category_id: midium_category_id
      };
      $.ajax({
        type: 'GET',
        url: url,
        data: data,
        dataType: 'json'
      })
      .done(function(data){
        $('.small_category').html(`
        <div class='select-wrapper'>
          <select class="select-form" name="q[parent_category_small_category_eq]" id="item_parent_category_small_category"><option value="">---</option>
          </select>
          <i class="fa fa-angle-down icon"></i>
        </div>`);

        $.each(data, function (i, val) {
        	$('#item_parent_category_small_category').append($("<option>").val(val.id).text(val.name));
        });
      })
    });
  });
});
