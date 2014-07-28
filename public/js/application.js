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

  $(".edit").click(function() {
    var question = $(this).data("question"); 
    $.ajax({
      url: "/question/"+question+"/edit", 
      type: 'get', 
      data: question.serialize
    }).success(function(data){
      data = JSON.parse(data)
    $("#q_edit").append('<span>Question: </spand> <input data-id='+data["id"]+' type="text" value="'+data["context"]+'"/> <br/>')
    
    if (data["style"] == "radio") {
    for (var i = 0; i < data["choices"].length; i++){
      $("#q_edit").append('<span>Choice: </spand> <input type="text" value="'+data["choices"][i]+'"/> <br />')}
    }
     $("#q_edit").show()
    }).fail(function(){
      console.log("Doesn't Work!")
    })
  }); 

  $(".edit").post(function() {

  })


	$('#cool').click(function(){
		$('#cool').paulund_modal_box();
	});

  // $('#surveys').on('click', '.deleteSurvey', function(){
  //   $(this).append('<br><br><div class="decision">Are you sure you want to delete this survey?<br><br> <button id="yes">Yes, please</button> <br><br> <button id="no">Absolutely not</button> </div>');

  //   $('#no').click(function(){
  //     $(this).parent().remove();
  //   })
  //   $('#yes').click(function(e){
  //   e.preventDefault();

  //   var oneSurveyId = $('span.hidden').text();

  //   $(this).parent().remove();
    

  //   $.ajax({
  //     url: '/surveys/'+oneSurveyId+'',
  //     type: 'delete',
  //     data: $(this).serialize
  //   }).success(function(data) {
  //     console.log(data)
  //     $('#surveys').hide();
  //     $('#surveys').show();
  //   })
  //  })
  // })

 

  $('#question-options').hide();
  $('#radio-option').hide();
  $('#text-option').hide();
  $('.hidden').hide();


  var survey_id = $('.hidden').html();
  var counter = 0


  $("#addQuestion").submit(function(e) {
    e.preventDefault();
    $('#new-questions').append($('#question-options'));
    $('#question-options').show();
  })

  $('form#radio').submit(function(e) {
    e.preventDefault();
    $('#radio-choice')[0].reset();
    $('#question-options').hide();
    $('#new-questions').append($('#radio-option'));
    $('#radio-option').show();
    $('#choices').empty();
  })

  $('#another-choice').submit(function(e){
    e.preventDefault();
    counter += 1
    $('#choices').append('<br><p>- <input type="text" name="selection[input'+counter+']" required> <span class="removeVar"> Remove Choice</span></p>');
  })

  $('#choices').on('click', '.removeVar', function(){
     $(this).parent().remove();
   })
  
  $('form#radio-choice').submit(function(e) {
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: '/surveys/'+survey_id+'/questions',
      data: $(this).serialize()
    }).success(function(data){
      $('#radio-option').hide();
      $('#submitted-questions').empty();
      $('#submitted-questions').html(data);
      console.log("sending")
    }).fail(function(data){
      console.log("doesn't work!")
    })
  })
  

  $('form#textbox').submit(function(e) {
    e.preventDefault();
    $('#textbox-choice')[0].reset();
    $('#new-questions').append($('#text-option'));
    $('#text-option').show();
    $('#question-options').hide();
  })
      
  $('form#textbox-choice').submit(function(e) {
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: '/surveys/'+survey_id+'/questions',
      data: $(this).serialize()
    }).success(function(data){
      $('#text-option').hide();
      $('#submitted-questions').empty();
      $('#submitted-questions').html(data)
    }).fail(function(data){
      console.log("doesn't work!")
    })
  })
})
