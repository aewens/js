define [
    "jquery",
    "underscore", 
    "backbone", 
    "models/status"
], ($, _, Backbone, Status) ->
    StatusView = Backbone.View.extend
        tagName: "div"
        events:
            "click .edit": "edit"
            "click .delete": "delete"
            "blur .s_content": "close"
            "keypress .s_content": "ifenter"
        initialize: ->
            this.template = _.template($("#status-tmpl").html())
        edit: (e) ->
            e.preventDefault()
            this.$(".s_content").attr("contenteditable", true).focus()
        close: (e) ->
            content = this.$(".s_content").text()
            this.model.get("status").set "content", content
            this.$(".s_content").removeAttr("contenteditable")
        ifenter: (e) ->
            keyCode = e.which || e.keyCode
            self    = this
            if keyCode == 13
                this.close()
                _.delay (-> self.$(".s_content").blur()), 100
        delete: (e) ->
            e.preventDefault()
            this.model.get("status_list").remove this.model.get("status")
        render: ->
            # tmpl = this.template this.model.get("status").toJSON()
            # $(this.el).addClass("media").html tmpl
            this.$el.html this.template this.model.get("status").toJSON()
            return this
        
    return StatusView