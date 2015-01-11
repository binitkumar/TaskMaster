  $(document).ready(function(){

    $( "#select-picker" ).autocomplete({
      source: function( request, response ) {
        $.ajax({
          url: "/home/contacts",
          dataType: "json",
          data: {
            q: request.term
          },
          success: function( data ) {
            response( data );
          }
        });
      },
      select: function( event, ui ) {
        val = ui.item ? ui.item.label : this.value ;
        window.location = "/home/navigation?key=" + val ;
      },
      minLength: 3,
      open: function() {
        $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
      },
      close: function() {
        $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
      }
    });
  });

