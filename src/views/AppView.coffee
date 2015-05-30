class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('game').get('playerHand').hit()
    # 'click .hit-button': -> Backbone.trigger 'playerHit', @
    'click .stand-button': -> @model.get('game').get('playerHand').stand()
    # 'click .stand-button': -> Backbone.trigger 'stand', @

  initialize: ->
    @listenTo Backbone, 'busted', @render
    @render()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get('game').get('playerHand')).el
    @$('.dealer-hand-container').html new HandView(collection: @model.get('game').get('dealerHand')).el
    return
