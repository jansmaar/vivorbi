$(document).ready(function(){
   // $(".form-control").blur(function() {
   //      //console.log(hallo);
   //      if($( this ).val().length === 0){
   //          console.log("fout");
   //          $(this).removeClass('valid');

   //          $('.errortekstinput').remove();
   //          $(this).addClass('error');
   //          var data = $('<p/>').addClass('errortekstinput').text("Dit veld is verplicht!");
   //          $(this).parent('.form-group').append(data);
   //      }else if($( this ).val().length >= 1) {
   //          $(this).removeClass('error');
   //          $('.errortekstinput').remove();
   //          $(this).addClass('valid');
   //      } else {
   //          $(this).removeClass('error');
   //          $('.errortekstinput').remove();  
   //      }   
   //  });

    function kindoferror(kindoferror){
          //var characterReg = '^[0-2]\d{1}[0-9]\d{1}:[0-6]\d{1}[0-6]\d{1}$';
           //var time = match.characterReg;
        switch(kindoferror) {
            case "titel":
                text = "Er moet wel een titel ingevuld worden";
            break;
         
            case "tijd":
                text = "De juiste tijd moet ingevuld worden 00:00 notatie";
           break;
            default:
                text = "Dit veld is verplicht!";
        }
    }



    $(".errorcheck").blur(function() {
        var error = $(this).attr("kindoferror");
       kindoferror(error);
        //console.log(hallo);
        if($( this ).val().length === 0){
            console.log("fout");
            $(this).removeClass('valid');

            //$('.errortekstinput').remove();
            $(this).addClass('error');
            var data = $('<p/>').addClass('errortekstinput').text(text);
           
            if($(this).next('.errortekstinput').length=== 0){
                 $(this).parent('.form-group').append(data);
            }
        }else if($( this ).val().length >= 1) {
            $(this).removeClass('error');
            $(this).next('.errortekstinput').remove();
            $(this).addClass('valid');
        } else {
            $(this).removeClass('error');
            $('.errortekstinput').remove();  
        }   
    });

    $( "form" ).submit(function() {
        if ( $(".error" ).val().length >= 1 ) {
        return true;
        }else {
        alert("Niet alle verplichte velden zijn ingevuld");
        return false;
        }
    });


});
