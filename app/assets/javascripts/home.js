// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require libs/owl.carousel.min.js

$('.owl-carousel').owlCarousel({
  loop:true,
  margin:0,
  nav:true,
  dots:false,
  items:1,
  autoplay:true,
  navText: ['<i class="fa fa-caret-left"></i>','<i class="fa fa-caret-right"></i>']
})
$('.owl-carousel2').owlCarousel({
  loop:true,
  margin:0,
  nav:false,
  dots:false,
  items:3,
  autoplay:true,
  navText: ['<i class="fa fa-caret-left"></i>','<i class="fa fa-caret-right"></i>']
})
