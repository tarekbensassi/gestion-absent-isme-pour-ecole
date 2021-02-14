
  $("#register-form").validate({
    rules: {
     
      nom: {
        required: true,
        nowhitespace: true,
        lettersonly: true
      },
  }
   
  });
