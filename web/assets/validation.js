$(function() {

  $.validator.setDefaults({
    errorClass: 'help-block',
    highlight: function(element) {
      $(element)
        .closest('.form-group')
        .addClass('has-error');
    },
    unhighlight: function(element) {
      $(element)
        .closest('.form-group')
        .removeClass('has-error');
    },
    errorPlacement: function (error, element) {
      if (element.prop('type') === 'checkbox') {
        error.insertAfter(element.parent());
      } else {
        error.insertAfter(element);
      }
    }
  });

  $.validator.addMethod('strongPassword', function(value, element) {
    return this.optional(element) 
      || value.length >= 6
      && /\d/.test(value)
      && /[a-z]/i.test(value);
  }, 'Your password must be at least 6 characters long and contain at least one number and one char\'.')

  $("#register-form").validate({
    rules: {
      mail: {
        required: true,
        email: true,
        remote: "http://localhost:3000/inputValidator"
      },
      password: {
        required: true,
        strongPassword: true
      },
      password2: {
        required: true,
        equalTo: '#password'
      },
      nom: {
        required: true,
        nowhitespace: true,
        lettersonly: true
      },
      prenom: {
        required: true,
        nowhitespace: true,
        lettersonly: true
      },
      businessName: {
        required: true
      },
      tel: {
        required: true,
        digits: true,
        phonesUK: true
      },
      addresse: {
        required: true
      },
      town: {
        required: true,
        lettersonly: true
      },
      postcode: {
        required: true,
        postcodeTN: true
      },
      terms: {
        required: true
      }
    },
    messages: {
      mail: {
        required: 'Please enter an email address.',
        mail: 'Please enter a <em>valid</em> email address.',
        remote: $.validator.format("{0} is already associated with an account.")
      }
      
    }
  });

});