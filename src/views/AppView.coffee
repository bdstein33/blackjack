class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button button">Hit</button> <button class="stand-button button">Stand</button> <button class="new-game-button button">New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="game-info-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('game').get('playerHand').hit()
    # 'click .hit-button': -> Backbone.trigger 'playerHit', @
    'click .stand-button': -> @model.get('game').stand()
    # 'click .stand-button': -> Backbone.trigger 'stand', @

  initialize: ->
    @listenTo Backbone, 'busted gameOver', @render
    @render()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get('game').get('playerHand')).el
    @$('.dealer-hand-container').html new HandView(collection: @model.get('game').get('dealerHand')).el
    @$('.game-info-container').html new InfoView(model: @model.get('game').get('info')).el
    return
