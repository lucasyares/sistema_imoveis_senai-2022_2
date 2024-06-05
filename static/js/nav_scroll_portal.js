window.onscroll = function () {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
        document.getElementById("homepage__nav").className = "homepage__nav homepage__nav--pequeno position-fixed py-1 px-5 d-flex justify-content-between align-items-center";
        document.getElementById("homepage__nav__logo").setAttribute("src", "/static/imgs/logo3.png");
    } else {
        document.getElementById("homepage__nav").className = "homepage__nav  position-fixed py-3 px-5 d-flex justify-content-between align-items-center";
        document.getElementById("homepage__nav__logo").setAttribute("src", "/static/imgs/logo4.png");
    }
};