export default function navbar() {

const landingPage = document.querySelector("#banner-surprise-me-button");
const commingSoon = document.querySelector(".coming-soon");
const logo = document.querySelector(".name-logo");

const bookNow = document.querySelector(".booknow");
if (bookNow != null){
bookNow.hidden = true;
}

if (commingSoon != null) {
  logo.classList.add("navbar-black");
}

if (landingPage != null) {

   if (bookNow != null){
  bookNow.hidden = false;
  }

window.onscroll = function() {myFunction()};

// Get the navbar
var navbar = document.querySelector(".navbar-wagon");
const banner = document.querySelector(".banner-landing-page");
const book = document.querySelector(".navbar-wagon-item");
const hiw = document.querySelector(".hiw");

// Get the offset position of the navbar
const sticky = banner.offsetTop - banner.offsetHeight;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
  if (window.pageYOffset >= - sticky) {
    navbar.classList.add("navbar-sticky")
    navbar.classList.remove("navbar-lp")
    logo.classList.add("navbar-black")
    book.classList.add("navbar-orange")
    hiw.classList.add("hiw-padding-top")
  } else {
    navbar.classList.remove("navbar-sticky");
    navbar.classList.add("navbar-lp")
    logo.classList.remove("navbar-black")
    book.classList.remove("navbar-orange")
    hiw.classList.remove("hiw-padding-top")
  }
}
}
}
