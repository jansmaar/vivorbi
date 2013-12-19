$(document).ready(function(){
   $(".form-control").blur(function() {
        //console.log(hallo);
        if($( this ).val().length === 0){
            console.log("fout");
            $(this).removeClass('valid');

            $('.errortekstinput').remove();
            $(this).addClass('error');
            var data = $('<p/>').addClass('errortekstinput').text("Dit veld is verplicht!");
            $(this).parent('.form-group').append(data);
        }else if($( this ).val().length >= 1) {
            $(this).removeClass('error');
            $('.errortekstinput').remove();
            $(this).addClass('valid');
        } else {
            $(this).removeClass('error');
            $('.errortekstinput').remove();  
        }   
    });
});
