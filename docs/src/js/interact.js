window.addEventListener('DOMContentLoaded',init,false);
            
function init() {
    var currentButton = document.getElementsByClassName("current-link");
    currentButton[0].addEventListener('click', changeColor, false)
    currentButton[0].addEventListener('click', alertMessage, false)
}


function loadUrl(){
  window.location.href = "index.html";
}

function alertMessage() {
    alert('You\'re already on this page.');
}

function changeColor() {
    var header = document.getElementById("pota");
    header.style.backgroundColor = "blue";
}