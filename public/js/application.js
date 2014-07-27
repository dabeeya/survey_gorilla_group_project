$(document).ready(function(){
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
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



// Thanks internet!

//create three initial fields
// var startingNo = 3;
// var $node = "";
// for(varCount=0;varCount<=startingNo;varCount++){
//     var displayCount = varCount+1;
//     $node += '<p><label for="var'+displayCount+'">Variable '+displayCount+': </label><input type="text" name="var'+displayCount+'" id="var'+displayCount+'"><span class="removeVar">Remove Variable</span></p>';
// }
// //add them to the DOM
// $('form').prepend($node);
// //remove a textfield
// $('form').on('click', '.removeVar', function(){
//    $(this).parent().remove();

// });
// //add a new node
// $('#addQuestion').on('click', function(){
// varCount++;
// $node = '<p><label for="var'+varCount+'">Variable '+varCount+': </label><input type="text" name="var'+varCount+'" id="var'+varCount+'"><span class="removeVar">Remove Variable</span></p>';
// $(this).parent().before($node);
// });
