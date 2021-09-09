

 function gestoreMappa () {
     try {
        var x = nodiClassFacs;
        var i;
        
        for (i = 0; i < x.length; i++) {
          if (x[i].getAttribute("id") == "#"+this.id) {
             x[i].style.backgroundColor = "#f0dbdb";
             }
          }
       } catch ( e ) {
          alert("gestoreMappa " + e);
       }
    }
 
 function gestoreMappaOut () {
    try {
       var i;
       var x = nodiClassFacs;
       for (i = 0; i < x.length; i++) {
          nodiClassFacs[i].style.backgroundColor = "#fff";
          
       }
       
    } catch(e) {
       alert("gestoreMappaOut" + e)
    }
 }
 
 
 var nodoMessaggio;
 var map;
 
 
 function gestoreLoad () {
     
    var nodiArea = document.getElementsByTagName("area");
    for (var i = 0; i < nodiArea.length; i++){
       nodiArea[i].onmouseenter = gestoreMappa;
       nodiArea[i].onmouseleave = gestoreMappaOut;
    }
        
    nodiClassFacs = document.getElementsByClassName("facsimile");
    nodoMessaggio = document.getElementById("immagine-facsimile-fronte");
        
    var nodoTesto = document.createTextNode("");
    nodoMessaggio.appendChild(nodoTesto);
   
    $(function() {
       $('img[usemap]').maphilight();
       $('.facsimile').mouseover(function(e) {
          $(this.id).mouseover();
          $(this).css("background-color", "#f0dbdb");
       }).mouseout(function(e) {
          $(this.id).mouseout();
          $(this).css("background-color", "#fff");
       });
   });
 
 
   $.fn.maphilight.defaults = {
     fill: true,
     fillColor: '300929',
     fillOpacity: 0.2,
     stroke: true,
     strokeColor: 'f0dbdb',
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
 