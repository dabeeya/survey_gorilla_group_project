$(document).ready(function(){
//   $('.button').on('click', function(event){
//     event.preventDefault();
//     $.post('/color', function(data){
//       $('********(' + ********* + ')').html('*****', data.*****)
//     });
//   });
// });

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  var question;
  var input ="";
  var n = 0
  $('#question-options').hide();
  $('#radio-option').hide();
  $('#text-option').hide();
  var options = $('#question-options');
  var radio = $('#radio-option');
  var textbox = $('#text-option');

  $("#addQuestion").submit(function(e) {
    e.preventDefault();
    var questionID = n+1;
    $('#new-questions').append(options);
    options.show();

    $('#radio').submit(function(e) {
      e.preventDefault();
      var choice = "radio";
      options.hide();
      $('#new-questions').append(radio);
      radio.show();
      $('#another-choice').submit(function(e){
        e.preventDefault();
        $('#choices').after('<br><td><input type="radio"><input type="text" name="choice[input]"></td>');

      })
    })
    $('#textbox').submit(function(e) {
      e.preventDefault();
      var choice = "textbox";
      options.hide();
      $('#new-questions').append(textbox);
      textbox.show();
    })

    $()


    // $.ajax({
    //   type: 'post',
    //   url: '/questions/new',
    //   data: "type=" + choice
    // }).success(function(data){
    //   console.log("works!")
    //   console.log(data)
    // }).fail(function(data){
    //   console.log("doesn't work!")
    // })

  })


});



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
