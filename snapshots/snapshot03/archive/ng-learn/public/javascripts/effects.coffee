$ ->
    $(".btn, .popup").on "click", ->
        if not $(this).is ".btn.on" and not $(this).is ":hidden"
            $(".popup, .app, .btn").toggleClass "on"

    $(document).on "keydown", (e) ->
        if e.keyCode is 27 and $(".btn").is ".on"
            $(".popup, .app, .btn").toggleClass "on"