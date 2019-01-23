$(function() {
  $('input[id=item_image]').change(function() {

    var file = $(this).prop('files')[0];

    if (! file.type.match('image.*')) {
      $(this).val('');
      $('#photo_view').html('');
      return;
    }

    var reader = new FileReader();

    reader.onload = function() {
      $('#photo_view').css('background-image','url('+reader.result+')');
    }
    reader.readAsDataURL(file);
  });
});
