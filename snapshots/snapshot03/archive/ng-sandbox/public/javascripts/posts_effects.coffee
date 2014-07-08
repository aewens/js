$ ->
    $("input[name=title]").focus()
    $(".items").children().on "click", ->
        $(".items").children().removeClass "active"
        $(this).addClass "active"
    $("#theme").on "click", ->
        if $(".body").is ".body.default"
            $(".body").removeClass("default").addClass "monochrome"
            $(this).text "Default"
            $("html").css("background", "#fff")
        else
            $(".body").removeClass("monochrome").addClass "default"
            $(this).text "Monochrome"
            $("html").css("background", "#eee")
    $("#post").on "click", ->
        $(".post").toggle()
        if $(this).text() == "Show"
            $(this).text "Hide"
        else
            $(this).text "Show"
    $("a[slug]").on "click", (e) ->
        e.preventDefault()
        slug = $(this).attr("slug")
        $("footer[slug="+slug+"]").toggle()
        $("section[slug="+slug+"]").toggle()
        
        if $("article[slug="+slug+"]").hasClass "selected"
            $(".content article").each ->
                if !$(this).hasClass "post"
                    $(this).show()
        else
            
            $(".content article").each ->
                if !$(this).is "[slug="+slug+"]"
                    if !$(this).hasClass "post"
                        $(this).hide()
        $("article[slug="+slug+"]").toggleClass "selected"









