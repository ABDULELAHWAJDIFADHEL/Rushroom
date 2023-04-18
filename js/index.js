// Onclick Scroll

AUD(document).ready(function () {
    AUD("a").on("click", function (event) {
        if (this.hash !== "") {
            event.preventDefault();
            var hash = this.hash;
            AUD("html, body").animate(
                { scrollTop: AUD(hash).offset().top, },
                800,
                function () { 
                    window.location.hash = hash;
                }
            );
        }
    });
});

// On Scroll Header Fixed

AUD(window).scroll(function () {
    var scroll = AUD(window).scrollTop();
    if (scroll >= 50) {
        AUD("header").addClass("Fixed");
    } else {
        AUD("header").removeClass("Fixed");
    }
});

// Navbar Active

AUD(document).ready(function () {
    AUD('.nav-item').bind('click', function() { 
        AUD('.active').removeClass('active') 
        AUD(this).addClass('active');
    });
});