// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function (){  
    $('#event_date').datepicker({ dateFormat: 'yy-mm-dd' });

		$('.destroy').click(function () {
			var answer = confirm('Are you sure you want to delete this?');
		  if (answer) {
				$('#' + this.dataset['model'] + '_' + this.dataset['id']).hide();
				$.post('/' + this.dataset['model'] + '/' + this.dataset['id'], {_method : 'delete', authenticity_token : $('meta[name=csrf-token]').attr("content")});
			} else {
				return false
			}
		});
});