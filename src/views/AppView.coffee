class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button button">Hit</button> <button class="stand-button button">Stand</button> <button class="new-game-button button">New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('game').get('playerHand').hit()
    # 'click .hit-button': -> Backbone.trigger 'playerHit', @
    'click .stand-button': -> @model.get('game').stand()
    # 'click .stand-button': -> Backbone.trigger 'stand', @

  initialize: ->
    @listenTo Backbone, 'gameOver', @render
    @$el.html @template()
    @render()
    # @$('.game-info-container').html new InfoView(model: @model.get('game').get('info')).el
    @$el.append new InfoView(model: @model.get('game').get('info')).el

  render: ->
    @$('.player-hand-container').html new HandView(collection: @model.get('game').get('playerHand')).el
    @$('.dealer-hand-container').html new HandView(collection: @model.get('game').get('dealerHand')).el


    return
