// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
////= require jquery
// = require_tree .
//= require bootstrap-sprockets

function showAnswer(thechosen, theicon) {
    $('.container.div').each(function(){ // for hver .container.div kjør denne funksjonen.
        if($(this).attr("id") === thechosen){ // hvis id'en til denne boksen er lik parameteret sendt med funksjonen
            $(this).toggle(600); // Får frem idvven, og fjerner den om den allerede er åpnet.
        }
        else {
            $(this).slideUp(600) // Når en annen knapp trykkes blir forrige div slidet up eller fjernet.
        }
    });
    $('.glyphicon').each(function(){
        if($(this).attr("id") === theicon){
            //console.log("true");
            $(this).toggleClass("glyphicon-minus");
        }
        else{
            //console.log("false");
            $(this).removeClass("glyphicon-minus")

        }
    });
}

