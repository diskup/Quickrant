$(function () {
  $('.tab').click(function(){
    $('.tab-active').removeClass('tab-active');
    $(this).addClass('tab-active');
    $('.box-show').removeClass('box-show');
    const index=$(this).index();
    $('.tab-box').eq(index).addClass('box-show');
  });
});