$(function(){

  $('#add-bucket').on('click', () => {
    $('.ui.basic.modal').modal('show')
  })

  $('#myselect').on('change', () => {
    var select = $('#myselect').val()
    if (select == 'sign out'){
      //sign out
      alert('bye')
      window.location.href = "/users/sign_out";

    }else if(select == 'create bucket'){
      //new modal pop up
      alert('new')
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

  // $( "select" ).change(function() {
  //   var str = "";
  //   $( "select option:selected" ).each(function() {
  //     str += $( this ).text() + " ";
  //   });
  //   if(str === 'sign out'){
  //     console.log('hi')
  //     // $('.ui.basic.modal').modal('show')
  //   }
  // // })
  // .trigger( "change" );


  // function changeFunc() {
  //  var selectBox = document.getElementById("selectBox");
  //  var selectedValue = selectBox.options[selectBox.selectedIndex].value;
  //  alert(selectedValue);
  // }


})
