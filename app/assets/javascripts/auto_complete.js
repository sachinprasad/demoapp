$(document).ready(function(){
  var first_name = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('team'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url:'/home/%QUERY/search',
      filter: function(response){
        return response.first_name;
      }
    }
  });

  var last_name = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('team'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url:'/home/%QUERY/search',
      filter: function(response){
        return response.last_name;
      }
    }
  });

  first_name.initialize();
  last_name.initialize();

  $('#multiple-datasets .typeahead').typeahead({
      highlight: true
    },
    {
      displayKey: 'name',
      source: first_name.ttAdapter(),
      templates: {
        empty: [
                    '<div class="tt-empty-message">',
                    'No Results',
                    '</div>'
        ].join('\n'),
        header: '<h3 class="user-name">First Name </h3>'
      }
    },
    {
      displayKey: 'name',
      source: last_name.ttAdapter(),
      templates: {
        empty: [
                    '<div class="tt-empty-message">',
                    'No Results',
                    '</div>'
        ].join('\n'),
        header: '<h3 class="user-name">Last Name</h3>'
      }
    });
});
