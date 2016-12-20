$(document).ready(function() {

    function calendar() {
        var months = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień"];
        var days = ["Nd", "Pon", "Wt", "Śr", "Czw", "Pt", "Sob"];

        var d = new Date();
        var day = days[d.getDay()];
        var date = d.getDate();
        var month = months[d.getMonth()];
        var year = d.getFullYear();
        var x = document.getElementById("time");

        $('.navbar-calendar p').html(day + ", " + date + " " + month + " " + year);
    }

    function time() {
        var d = new Date();
        var hr = d.getHours();
        var min = d.getMinutes();
        var sec = d.getSeconds();

        if(sec < 10)
        {
            sec = "0" + sec;
        }

        $('.navbar-clock p').html(hr + " : " + min + " : " + sec);
    }

    calendar();
    time();
    setInterval(calendar, 1000);
    setInterval(time, 1000);

    $('.navbar-weather i').removeClass('fa-bolt').addClass('fa-globe');
    $('.navbar-weather p').html('Kraków');

  $("#nowy-producent").validate({
    rules: {
      name: {
        required: true
      },
      mail: {
        required: true,
        email: true
      },
      web: {
        required: true,
        url: true
      },
      phone: {
        required: true,
        digits: true
      }
    }
  });

  $("#nowa-kategoria").validate({
    rules: {
      name: {
        required: true
      }
    }
  });

  $("#nowy-lek").validate({
    rules: {
      name: {
        required: true
      },
      price: {
        required: true
      },
      capacity: {
        digits: true,
        required: true
      },
      measure: {
        required: true
      },
          description: {
              required: true
      },
      manufacturer: {
        required: true
      },
      category: {
        required: true
      }
    }
  });

  $("#nowa-partia").validate({
    rules: {
      manufacturedAt: {
        required: true
      },
      endAt: {
        required: true
      },
      serialNumber: {
        required: true
      },
      amount: {
        required: true,
        digits: true,
        min: 1
      }
    }
  });

    /*
   * Translated default messages for the jQuery validation plugin.
   * Locale: PL (Polish; język polski, polszczyzna)
   */
  $.extend( $.validator.messages, {
  	required: "To pole jest wymagane.",
  	remote: "Proszę o wypełnienie tego pola.",
  	email: "Proszę o podanie prawidłowego adresu email.",
  	url: "Proszę o podanie prawidłowego URL.",
  	date: "Proszę o podanie prawidłowej daty.",
  	dateISO: "Proszę o podanie prawidłowej daty (ISO).",
  	number: "Proszę o podanie prawidłowej liczby.",
  	digits: "Proszę o podanie samych cyfr.",
  	creditcard: "Proszę o podanie prawidłowej karty kredytowej.",
  	equalTo: "Proszę o podanie tej samej wartości ponownie.",
  	extension: "Proszę o podanie wartości z prawidłowym rozszerzeniem.",
  	maxlength: $.validator.format( "Proszę o podanie nie więcej niż {0} znaków." ),
  	minlength: $.validator.format( "Proszę o podanie przynajmniej {0} znaków." ),
  	rangelength: $.validator.format( "Proszę o podanie wartości o długości od {0} do {1} znaków." ),
  	range: $.validator.format( "Proszę o podanie wartości z przedziału od {0} do {1}." ),
  	max: $.validator.format( "Proszę o podanie wartości mniejszej bądź równej {0}." ),
  	min: $.validator.format( "Proszę o podanie wartości większej bądź równej {0}." ),
  	pattern: $.validator.format( "Pole zawiera niedozwolone znaki." )
  } );



  $("#manufacturedAt").datepicker({ dateFormat: 'dd/mm/yy' });
  $("#endAt").datepicker({ dateFormat: 'dd/mm/yy' });
  $("#dateOfBirthday").datepicker({ dateFormat: 'dd/mm/yy' });



});

$(window).load(function() { // makes sure the whole site is loaded
    $('#status').fadeOut(); // will first fade out the loading animation
    $('#preloader').fadeOut(); // will fade out the white DIV that covers the website.
    $('body').delay(350).css({
        'overflow': 'visible'
    });
});
