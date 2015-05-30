class window.InfoView extends Backbone.View

  className: 'main-info-text'
  tagName: 'h1'
  template: _.template '
    <%= this.model.get("text") %>
  '

  initialize: ->
    console.log @model.get 'text'
    @listenTo Backbone, 'busted gameOver', @render
    @render()


  render: ->
    # @$el.children().detach()
    @$el.html @template()
    # console.log @template()
    # console.log @$el.html()
    # @$('.game-info-container').html @template()
    return
