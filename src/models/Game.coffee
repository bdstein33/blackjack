# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @startNewGame()
    @listenTo Backbone, 'busted', @startNewGame
    return

  startNewGame: ->
    console.log "Game model method startNewGame"
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer(model: @model)
    @set 'dealerHand', deck.dealDealer(model: @model)
    return
