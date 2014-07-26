// $(document).ready(function(){
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

  $("#addQuestion").on("click", function() {
    $.ajax({
      url: "/new_question"
    })
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
