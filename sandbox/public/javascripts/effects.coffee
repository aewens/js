$ ->
    $("input[type=text]").addClass "form-control"
    $("input[type=text]")[0].focus()
    if $(".theme").is ".theme.default"
        console.log "So colorful. Much hues. Very art. Wow."
        $("header,body,article,.widget,.btn,.theme").addClass "color"
    $(".btn, .popup").on "click", ->
        if not $(this).is ".btn.on" and not $(this).is ":hidden"
            $(".popup, .app, .btn, .backdrop").toggleClass "on"

    $(document).on "keydown", (e) ->
        if e.keyCode is 27 and $(".btn").is ".on"
            $(".popup, .app, .btn, .backdrop").toggleClass "on"
            
    $(".theme").on "click", ->
        $("header,body,article,.widget,.btn,.theme").toggleClass "color"
        if $(this).is ".theme.default"
            $(this).removeClass("default").addClass "monochrome"
        else
            $(this).removeClass("monochrome").addClass "default"
            