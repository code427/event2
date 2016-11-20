var show = 1;
var x;
window.onload = function () {
     x= document.getElementsByClassName("img");

    for (i = 1; i < x.length; i++) {
        x[i].style.display = "none";
    }

    setInterval(rotate, 3000);
}


function rotate() {
      
    x[show - 1].style.display = "none";
    if (show >= x.length) { show = 0;}
    x[show++].style.display = "list-item";
}



