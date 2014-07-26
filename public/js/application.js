$(document).ready(function(){
	$('#survey_edit').click(function(){
		$('.q_button_head').css("visibility", "visible");
		$('.q_button').css("visibility", "visible");
		$('.q_button.delete').on("click", function(){
			$(this).parent('td').parent('#row').remove();
		});
		$('.q_button.edit').on("click", function(){
			$(this).parent('td').parent('#row').html();
		});
	});
	$('#cool').click(function(){
		$('#cool').paulund_modal_box();
	});
});

// $(document).ready(function(){
// 	$('.paulund_modal').paulund_modal_box();
// });










