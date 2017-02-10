var documentready = function(){

  $('#follow').on('click', (e)=> {
    e.preventDefault();

  })

  $('#add-bucket').on('click', () => {
    $('.ui.basic.modal').modal('show');
  })

  $('#myselect').on('change', () => {
    var select = $('#myselect').val()
    if (select == 'sign out'){
      //sign out
      alert('bye')
      window.location.href = "/users/sign_out";

    }else if(select == 'create bucket'){
      //new modal pop up
      $('.ui.basic.modal').modal('show')
      $('#myselect').clear
    }else {
      //edit profile modal
        $('#edit-profile')
        .modal('show')
        ;
        select = ""

    }

  })


  //dynamically add fields for form
  $('#add-button').click(function(event){
    var $button = $(this)
    var url = $(this).data('url')

    $.get(url, function(response){
      $button.before(response)
    })
    event.preventDefault();
  })


  // follow and unfollow
  $('#follow-button').click(function(event){
    var url = $(this).data('url')
    console.log(url)
    $.post(url, function(response) {
      html = $.parseHTML( response )
      $("#follow-button").replaceWith(html);
    });
    event.preventDefault();
  })

  $('#unfollow-button').click(function(event){
    var url = $(this).data('url')
    console.log(url)
    $.post(url, function(response) {
      html = $.parseHTML( response )
      $("#unfollow-button").replaceWith(html);
      console.log(response)
    });
    event.preventDefault();
  })


}

$(document).on('turbolinks:load',  documentready);
