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
    'click .new-game-button': -> @model.get('game').startNewGame()

  initialize: ->
    @listenTo Backbone, 'gameOver', @disableButtons
    @listenTo Backbone, 'newGame', @render
    @$el.html @template()
    @render()
    # @$('.game-info-container').html new InfoView(model: @model.get('game').get('info')).el
    @$el.append new InfoView(model: @model.get('game').get('info')).el

  render: ->
    @$('.player-hand-container').html new HandView(collection: @model.get('game').get('playerHand')).el
    @$('.dealer-hand-container').html new HandView(collection: @model.get('game').get('dealerHand')).el
    # $('.new-game-button').addClass('new-game-button-disabled red-button')
    # $('.new-game-button').removeClass('new-game-button button')
    $('.stand-button-disabled').addClass('stand-button button')
    $('.stand-button-disabled').removeClass('stand-button-disabled red-button')
    $('.hit-button-disabled').addClass('hit-button button')
    $('.hit-button-disabled').removeClass('hit-button-disabled red-button')

    return

  disableButtons: ->
    $('.hit-button').addClass('hit-button-disabled red-button')
    $('.hit-button').removeClass('hit-button button')
    $('.stand-button').addClass('stand-button-disabled red-button')
    $('.stand-button').removeClass('stand-button button')
    # $('.new-game-button').addClass('new-game-button-disabled red-button')
    # $('.new-game-button').removeClass('new-game-button button')
