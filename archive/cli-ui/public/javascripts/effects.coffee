$ ->
    $("input[type=text]")[0].focus()
    $("input[type=text]").addClass "form-control"
    if $(".theme").is ".theme.default"
        $("header,html,body,article,.widget,.btn,.theme").addClass "transition"
    $(".button, .popup").on "click", ->
        if not $(this).is ".button.on" and not $(this).is ":hidden"
            $(".popup, .app, .button, .backdrop").toggleClass "on"

    $(document).on "keydown", (e) ->
        if e.keyCode is 27 and $(".button").is ".on"
            $(".popup, .app, .button, .backdrop").toggleClass "on"
            
    $(".theme").on "click", ->
        $("header,html,body,article,.widget,.btn,.theme").toggleClass "mono"
        $("input[type=text]")[0].focus()
        if $(this).is ".theme.default"
            $(this).removeClass("default").addClass "monochrome"
        else
            $(this).removeClass("monochrome").addClass "default"
            