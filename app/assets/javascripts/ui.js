$.when(
  $.getScript("https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.6/semantic.min.js"),

  $.Deferred(function( deferred ) {
    $( deferred.resolve );
  })
).done(()=>{
$(document).ready(function(){

//menu dropdown
  $('#hybrid select')
    .dropdown({
      on: 'hover'
  });

//follow on card hover
  $('.special.cards .image').dimmer({
    on: 'hover'
  });



  })
})
