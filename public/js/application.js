$(document).ready(function(){
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  var question;
  var input ="";
  var n = 0
  $('#question-options').hide();
  $('#radio-option').hide();
  $('#text-option').hide();
  $('.hidden').hide();

  var survey_id = $('.hidden').html();
  var options = $('#question-options');
  var radio = $('#radio-option');
  var textbox = $('#text-option');

  $("#addQuestion").submit(function(e) {
    e.preventDefault();
    $('#new-questions').append(options);
    options.show();
  })

  $('#radio').submit(function(e) {
    e.preventDefault();

    $('#radio-choice')[0].reset();
    $('#choices').html('');
    $('#choices').html('<tr id="choices"></tr>')
    console.log($('#choices'));

    options.hide();
    
    $('#new-questions').append(radio);
    radio.show();
    
    var counter = 0
    
    $('#another-choice').submit(function(e){
      e.preventDefault();
      counter += 1
      $('#choices').append('<br><td>- <input type="text" name="selection[input'+counter+']" required></td>');
    })
  })

  $('form#radio-choice').submit(function(e) {
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: '/surveys/'+survey_id+'/questions',
      data: $(this).serialize()
    }).success(function(data){
      radio.hide();
      $('#submitted-questions').empty();
      $('#submitted-questions').html(data);
      console.log("sending")
    }).fail(function(data){
      console.log("doesn't work!")
    })
  })
  })

    // $('#textbox').submit(function(e) {
    //   e.preventDefault();

    //   options.hide();
      
    //   $('#new-questions').append(textbox);
    //   textbox.show();

    //   $('form#textbox-choice').submit(function(e) {
    //     e.preventDefault();
    //     $.ajax({
    //       type: 'post',
    //       url: '/surveys/'+survey_id+'/questions',
    //       data: $(this).serialize()
    //     }).success(function(data){
    //       textbox.hide();
    //       $('#submitted-questions').empty();
    //       $('#submitted-questions').html(data)
    //     }).fail(function(data){
    //       console.log("doesn't work!")
    //     })
    //   })
    // })
  // })
// });



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
