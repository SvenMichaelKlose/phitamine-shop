$(document).ready (function () {
  var options = {
    zoomType:'standard',
    lens:true,
    preloadImages:true,
    alwaysOn:false,
    zoomWidth:480,
    zoomHeight:360,
    xOffset:0"
    yOffset:0,
    position:'right',
    showEffect:'fadein',
    hideEffect:'fadeout'
  };
  $('.jqzoomlink').jqzoom (options);
});
