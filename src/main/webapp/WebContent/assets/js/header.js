const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

// When the user scrolls the page, execute myFunction
function HandleStickyNavbar() {
    window.onscroll = function () {
        myFunction();
    };

// Get the navbar
    var navbar = $(".header-bottom");

// Get the offset position of the navbar
    var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
    function myFunction() {
        if (window.pageYOffset >= sticky) {
            navbar.classList.add("sticky");
        } else {
            navbar.classList.remove("sticky");
        }
    }
}
HandleStickyNavbar();


function handleModalUser(e) {
    var modalUser = $(".header-function .modal-user");
    var nameCustomer = document.querySelector(".header-function .modal-user p span");

    if (e.getAttribute("check-user") !== "") {
        modalUser.classList.toggle("active-modal");
        nameCustomer.innerHTML = e.getAttribute("check-user");
    } else {
        location = "login.jsp";
    }
}
function handleCloseModal(e) {
    var parent = e.parentNode;
    e.onclick = () => {
        parent.classList.toggle("active-modal");
    }
}   