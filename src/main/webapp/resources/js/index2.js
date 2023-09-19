$(() => {


    $('.slide-one-item').owlCarousel({
        center: false,
        autoplayHoverPause: true,
        items: 1,
        loop: true,
        stagePadding: 0,
        margin: 0,
        smartSpeed: 1500,
        autoplay: true,
        pauseOnHover: false,
        dots: true,
        nav: true,
        navText: ['<i class="fa fa-light fa-arrow-left"></i>', '<i class="fa fa-light fa-arrow-right"></i>']
    });
    
   
});