// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function (){  
    $('#event_date').datepicker({ dateFormat: 'yy-mm-dd' });
});

$('.delete').click(function(model_name, item_id){
  var answer = confirm('Are you sure you want to delete this?');
  if (answer) {
		$('#' + model_name + '_' + item_id).hide();
		$.post('/' + model_name + '/' + item_id, {_method : 'delete', authenticity_token : '<%= form_authenticity_token %>'});
	} else {
		return false
	}
});