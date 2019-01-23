$(function(){
  $('#modal-open').on('click', function(){
    $('.modal').css('display', 'block');
    return false;
  });

  $('.modal-btn-cancel').on('click', function(){
    $('.modal').css('display','none');
  });

  locateCenter();
  $(window).resize(locateCenter);

  function locateCenter(){
    let w = $(window).width();
    let h = $(window).height();

    let cw = $('.modal').outerWidth();
    let ch = $('.modal').outerHeight();

    $('.modal').css({
      'left': ((w - cw) / 2) + 'px',
      'top': ((h - ch) / 2) + 'px'
    });
  }
});
