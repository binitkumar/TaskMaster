$(document).ready(function(){
var options = [
              {label: "George Washington",         value: "george"},
              {label: "Abraham Lincoln",           value: "abe"},
              {label: "Andrew Jackson",            value: "andy"},
              {label: "Thomas Jefferson",          value: "tj"},
              {label: "Alexander Hamilton",        value: "alex"},
              {label: "John F. Kennedy",           value: "jfk"},
              {label: "Teddy Roosevelt",           value: "teddy"},
              {label: "Franklin Delano Roosevelt", value: "fdr"}
          ];


  $("textarea").tagmate({
      exprs: {
          "@": Tagmate.NAME_TAG_EXPR,
          "#": Tagmate.HASH_TAG_EXPR,
          "$": Tagmate.PRICE_TAG_EXPR,
          "£": Tagmate.PRICE_TAG_EXPR
      },
      sources: {
          "@": function(request, response) {
              // use convenience filter function 
              var filtered = Tagmate.filterOptions(options, request.term);
              response(filtered);
          }
      },
      capture_tag: function(tag) {
          console.log("Got tag: " + tag);
      },
      replace_tag: function(tag, value) {
          console.log("Replaced tag: " + tag + " with: " + value);
      },
      highlight_tags: true,
      highlight_class: "hilite",
      menu_class: "menu",
      menu_option_class: "option",
      menu_option_active_class: "active"
  });
})
