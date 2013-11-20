$(document).ready(function(){
    var inInvited = [""];
    var contacts = ["Jorik Jansma", "Jan Janssen", "Piet Hendriksen", "Hendrika Vera de Vrede"];
    $('#add').click(function() {
        var toAdd = $("input[name=message]").val();
        //var checkBox = '<input type="checkbox" checked="checked" />';
        var adding = '<i class="fa fa-times-circle-o fa-2x remove"></i>'; //"<button class=\"remove\">X</button>";
        var array = ["<li class=\"invited\">", toAdd, adding, "</li>"].join( "" );
        $("input[name=message]").val("");
        
        //errorhandeling and if succes adds contact in id:addperson
        if($.inArray(toAdd, contacts) > -1){
            if($.inArray(toAdd, inInvited)===-1){
                $('#addperson').append(array);
                inInvited.push(toAdd);
            }
            else { 
                invitedError = $('<p/>').addClass('error').html('De zelfde persoon kan niet twee keer worden toegevoegd!');
                $('#addperson').prepend(invitedError);
                $('.error').fadeTo(2000, 0.5);
            }
        }
        else if(toAdd ===""){
            invitedError = $('<p/>').addClass('error').html('Er moet wel iemand uitgenodigd worden met een naam!');
            $('#addperson').prepend(invitedError);
            $('.error').fadeTo(2000, 0.5);
        }
        else {
            invitedError = $('<p/>').addClass('error').html('Er kan niet iemand worden toegevoegd die niet in de contact lijst staat');
            $('#addperson').prepend(invitedError);
            $('.error').fadeTo(2000, 0.5);
        }
    });

    //Removes the added invite
    $(document).on('click', '.remove', function(evt){
        $(this).parent('.invited').remove();
        var deletion = $(this).parent('.invited').text();
        inInvited.splice($.inArray(deletion.substr(0,deletion.length-1), inInvited),1);
    });

    //autocomplete the begin search for contacts
    $("#tags").autocomplete({
    source: contacts
    });

    //date for picking a date for the event(from plugin jquery)
    // $( "#datepicker" ).datepicker({
    //     showWeek: false,
    //     firstDay: 1
    // }); 
    
});



