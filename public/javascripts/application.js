// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function reset_search_form(field){
  searchField.val('Buscar');
}

jQuery(document).ready(function()
{
  searchField = $('form.search_form input');
  reset_search_form();
  searchField.click( function(){ if($(this).val() == 'Buscar') { $(this).val(''); } });
  searchField.blur( function(){ 
    if($(this).val() == '') { 
      $(this).val('Buscar');
    } 
  });

})
