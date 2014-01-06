$(document).ready(function(){
var items = [];
// $.getJSON( '/users', function( data ) {
    
//     $.each( data, function( key, val ) {
//     items.push( val.id );
    
//     });
//     });
var id = 28 //$(this).attr('id');
$.ajax({
    url: '/events/'+ id + '/edit',
    type: 'GET',
    //data: {id: id},
    dataType: 'json',
    success: function(data){
        $.each(data, function( key, val ) {
            items.push(val.id );
        });
    }
});

//console.log(items);
//BEGIN inviting participents   
    var inInvited = [];
    var idForDatabase = [];

    //get participents for editing
    $(".invited").each(function() {
        var edit = ($(this).text());
        var editVal = edit.substr(0, edit.length-1);
        var editId= Number(edit.substr(edit.length-1));
        inInvited.push(editVal);
        idForDatabase.push(editId);
    });
 
    function addingParticipants (participant, id) {
        var adding = '<i class="remove fa fa-times-circle-o fa-2x"></i>'; 
        var number = '<span class="number">'+id+'</span>';
        var toAdd = participant;
        var array = ["<li class=\"invited\">", toAdd, adding, number, "</li>"].join( "" );
        if($.inArray(toAdd, inInvited)===-1){
            $('#addperson').append(array);
            $('#addperson li:even').addClass('grey');
            inInvited.push(toAdd);  
            idForDatabase.push(id);
            //$('#hidden').val(idForDatabase);
            $('.rem').remove();
            $.each(idForDatabase, function(key, id){
                $('<input>').attr({type: 'hidden', class: 'rem', name: 'event[user_ids][]', value: id}).appendTo('#addperson');
            });
            //console.log(inInvited);
            //console.log(idForDatabase);
        }
        else {
            invitedError = $('<p/>').addClass('alert alert-danger').html('De zelfde persoon kan niet twee keer worden toegevoegd!');
            $('#addperson').prepend(invitedError);
            $('.alert-danger').fadeOut(5000);
        }
    }
      
    $("#tags").autocomplete({
    source: '/users',
    minLength: 2,
    select: function( event, ui ) {   
        addingParticipants( ui.item ? 
            ui.item.value : 
            "De gebruiker moet wel in de lijst staan",
            ui.item.id), 
            this.value = ("");
            return false;       
        }
    });


   

    //removes an invite
    $(document).on('click', '.remove', function(evt){
        //console.log(evt);
        var deletion = $(this).parent('.invited').text();
        var delVal = deletion.substr(0, deletion.length-1);
        var delId= Number(deletion.substr(deletion.length-1));
        inInvited.splice($.inArray(delVal, inInvited),1);
        idForDatabase.splice($.inArray(delId, idForDatabase),1);
        $(this).parent('.invited').remove();
         $('.rem').remove();
            $.each(idForDatabase, function(key, id){
                 $('<input>').attr({type: 'hidden', class: 'rem', name: 'event[user_ids][]', value: id}).appendTo('#addperson');
            });
        //console.log(delId);
        //console.log(delVal);  
        //$('#hidden').val(idForDatabase);
    });
//END inviting participents


//date for picking a date for the event(from plugin jquery)
    $( "#datepicker" ).datepicker({
        showWeek: false,
        firstDay: 1
    });

//MENU, functies voor het menu.
    $("#menu h3").click(function(){
        //slide up all the link lists
        $(":nth-child(2)", "#menu ul li h3").addClass('fa fa-chevron-down pull-right');
        $("#menu ul ul").slideUp();
        //slide down the link list below the h3 clicked - only if its closed
        if(!$(this).next().is(":visible"))
        {      
            $(this).next().slideDown();
            $(":nth-child(2)", this).removeClass('fa fa-chevron-down pull-right').addClass('fa fa-chevron-up pull-right');
        }
    });
//END MENU
});



