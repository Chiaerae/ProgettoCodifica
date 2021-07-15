
/*    Gestore che espande le forme abbreviate    */
function gestoreExpan () {
    try {
        var j;
        for (j=0; j < nodiTestoAbbr.length; j++) {
            nodiTestoAbbr[j].style.display = "unset";
            nodiTestoExpan[j].style.display = "none";
        }
        var i;
        for (i = 0; i < nodiExpan.length; i++) {
            nodiExpan[i].style.display = "unset";
            nodiAbbr[i].style.display = "none";
        }

    } catch(e) {
        alert("gestoreAbbr" + e)
    }
}

/*    Gestore che abbrevia le forme espanse    */
function gestoreAbbr () {
    try {
        var j;
        for (j=0; j < nodiTestoAbbr.length; j++) {
            nodiTestoAbbr[j].style.display = "none";
            nodiTestoExpan[j].style.display = "unset";
        }
        var i;
        for (i = 0; i < nodiExpan.length; i++) {
            nodiAbbr[i].style.display = "unset";
            nodiExpan[i].style.display = "none";
        }
        
    } catch(e) {
        alert("gestoreAbbr" + e)
    }
}




var nodiExpan;
var nodiAbbr;
var nodiTestoExpan;
var nodiTestoAbbr;
var nodiClickExpan;
var nodiClickAbbr;





/*    Gestore load    */
function gestoreLoad () {
    try {
        
        
        nodiTestoExpan = document.getElementsByClassName("estendi");
        nodiTestoAbbr = document.getElementsByClassName("abbrevia");
        var j;
        for (j = 0; j < nodiTestoExpan.length; j++) {
            nodiTestoAbbr[j].style.display = "none";
        }
        
        nodiExpan = document.getElementsByClassName("expan");
        nodiAbbr = document.getElementsByClassName("abbr");
        var i;
        for (i = 0; i < nodiExpan.length; i++) {
            nodiExpan[i].style.display = "none";
        } 
        
        nodiClickExpan = document.getElementsByClassName("clickExpan");
        nodiClickAbbr = document.getElementsByClassName("clickAbbr");
        var h;
        for (h = 0; h < nodiClickExpan.length; h++) {
            nodiClickExpan[h].onclick = gestoreExpan;
            nodiClickAbbr[h].onclick = gestoreAbbr;
        }

        
        
        
        
        
        

        
        
       
        

        

    
    } catch (e) {
        alert("gestoreLoad" + e)
    }
}
window.onload = gestoreLoad;
