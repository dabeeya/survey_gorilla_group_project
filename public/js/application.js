$(document).ready(function(){
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
    $('#choices').append('<br><td>- <input type="text" name="selection[input'+counter+']" required></td>');
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
