window.onload=function() {
  horloge('horlogeTel');
};

var btnUpDown= document.querySelector("#btn-up-down");
var iconUpDown = document.querySelector("#btn-up-down i");
var socialConnect = document.querySelector(".social-connect");

var montrerSocial = function () {
  iconUpDown.classList.toggle("btn-is-up");
  socialConnect.classList.toggle("is-up");
}

function horloge(el) {
  if(typeof el=="string") { el = document.querySelector("#horlogeTel"); }
  function actualiser() {
    var date = new Date();
    var str = date.getHours();
    str += ':'+(date.getMinutes()<10?'0':'')+date.getMinutes();
    el.innerHTML = str;
}
actualiser();
setInterval(actualiser,1000);
}

btnUpDown.addEventListener('click', montrerSocial);
