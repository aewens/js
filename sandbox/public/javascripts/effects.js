// Generated by CoffeeScript 1.6.3
(function() {
  $(function() {
    $("canvas")[0].focus();
    $("input[type=text]").addClass("form-control");
    if ($(".theme").is(".theme.default")) {
      $("header,body,article,.widget,.btn,.theme").addClass("color");
    }
    $(".btn, .popup").on("click", function() {
      if (!$(this).is(".btn.on" && !$(this).is(":hidden"))) {
        return $(".popup, .app, .btn, .backdrop").toggleClass("on");
      }
    });
    $(document).on("keydown", function(e) {
      if (e.keyCode === 27 && $(".btn").is(".on")) {
        return $(".popup, .app, .btn, .backdrop").toggleClass("on");
      }
    });
    return $(".theme").on("click", function() {
      $("header,body,article,.widget,.btn,.theme").toggleClass("color");
      if ($(this).is(".theme.default")) {
        return $(this).removeClass("default").addClass("monochrome");
      } else {
        return $(this).removeClass("monochrome").addClass("default");
      }
    });
  });

}).call(this);
