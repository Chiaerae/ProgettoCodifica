function gestoreRuota () {
   try {
      if (testoRuota.getAttribute("class") == "ruota") {
         testoRuota.setAttribute("class", "noRuota");
      }
      else {
         testoRuota.setAttribute("class", "ruota");
      }

   } catch(e) {
      alert("gestoreRuota" + e);
   }
}

function gestoreArea () {
    try {
       var x = nodiClassFacs;
       var i;
       
       for (i = 0; i < x.length; i++) {
         if (x[i].getAttribute("id") == "#"+this.id) {
            x[i].style.backgroundColor = "#e79d9d";
            }
         }
      } catch ( e ) {
         alert("gestoreArea " + e);
      }
   }

function gestoreEsciArea () {
   try {
      var i;
      var x = nodiClassFacs;
      for (i = 0; i < x.length; i++) {
         nodiClassFacs[i].style.backgroundColor = "#ffffff";
         
      }
      
   } catch(e) {
      alert("gestoreEsciArea" + e)
   }
}


var nodoMessaggio;
var nodiExpan;
var map;
var pulsanteRuota;
var testoRuota;

function gestoreLoad () {
    
   var nodiArea = document.getElementsByTagName("area");
   for (var i = 0; i < nodiArea.length; i++){
      nodiArea[i].onmouseenter = gestoreArea;
      nodiArea[i].onmouseleave = gestoreEsciArea;
   }
       
   nodiClassFacs = document.getElementsByClassName("facs");
   nodoMessaggio = document.getElementById("testoFacs");
       
   var nodoTesto = document.createTextNode("");
   nodoMessaggio.appendChild(nodoTesto);
   

   nodiExpan = document.getElementsByClassName("expan");
   var a;
   for (a=0; a < nodiExpan.length; a++) {
      nodiExpan[a].style.display = "none";
   }

   
   
   pulsanteRuota = document.getElementById("pulsanteRuota");
   testoRuota = document.getElementById("ruota");
   pulsanteRuota.onclick = gestoreRuota;

   $(function() {
      $('img[usemap]').maphilight();
      $('.facs').mouseover(function(e) {
         $(this.id).mouseover();
         $(this).css("background-color", "#e79d9d");
      }).mouseout(function(e) {
         $(this.id).mouseout();
         $(this).css("background-color", "#fff");
      });
  });


  $.fn.maphilight.defaults = {
	fill: true,
	fillColor: '000000',
	fillOpacity: 0.2,
	stroke: true,
	strokeColor: '',
	strokeOpacity: 1,
	strokeWidth: 1,
	fade: true,
	alwaysOn: false,
	neverOn: false,
	groupBy: false,
	wrapClass: true,
	shadow: false,
	shadowX: 0,
	shadowY: 0,
	shadowRadius: 6,
	shadowColor: 'FFFFFF',
	shadowOpacity: 0.8,
	shadowPosition: 'outside',
	shadowFrom: false
   }
      
   
      
}




window.onload = gestoreLoad;
