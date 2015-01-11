$(document).ready(function(){

  var ajax_request = false;
  $('textarea').textntags({
    triggers: {'#': {
      uniqueTags   : false,
      syntax       : _.template('[<%= title %>]'),
      parser       : /(#)\[(\d+):([\w\s\.\-]+):([\w\s@\.,-\/#!$%\^&\*;:{}=\-_`~()]+)\]/gi,
      parserGroups : {id: 4, type: 3, title: 2},
    }},
    onDataRequest:function (mode, query, triggerChar, callback) {
        // fix for overlapping requests
        if(ajax_request) ajax_request.abort();
        ajax_request = $.getJSON('/persons/tags', function(responseData) {
            query = query.toLowerCase();
            responseData = _.filter(responseData, function(item) { return item.name.toLowerCase().indexOf(query) > -1; });
            callback.call(this, responseData);
            ajax_request = false;
        });
    }
  });

  //$("#detail").css("height", "35px");
})
