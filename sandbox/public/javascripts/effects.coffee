$ ->
    if $(".theme").is ".theme.default"
        console.log "So colorful. Much hues. Very art. Wow."
        $("header").addClass "color"
        $("body").addClass "color"
        $("article").addClass "color"
        $(".widget").addClass "color"
        $(".btn, .theme").addClass "color"
    $(".btn, .popup").on "click", ->
        if not $(this).is ".btn.on" and not $(this).is ":hidden"
            $(".popup, .app, .btn, .backdrop").toggleClass "on"

    $(document).on "keydown", (e) ->
        if e.keyCode is 27 and $(".btn").is ".on"
            $(".popup, .app, .btn, .backdrop").toggleClass "on"
            
    $(".theme").on "click", ->
        $("header").toggleClass "color"
        $("body").toggleClass "color"
        $("article").toggleClass "color"
        $(".widget").toggleClass "color"
        $(".btn, .theme").toggleClass "color"
        if $(this).is ".theme.default"
            $(this).removeClass("default").addClass "monochrome"
        else
            $(this).removeClass("monochrome").addClass "default"
            