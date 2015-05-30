# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @startNewGame()
    @set 'info', info = new Info()
    @listenTo Backbone, 'playerBust dealerBust lose push win', @gameOver
    return

  startNewGame: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer(model: @model)
    @set 'dealerHand', deck.dealDealer(model: @model)
    return

  stand: ->
    playerHand = @get 'playerHand'
    dealerHand = @get 'dealerHand'
    dealerHand.models[0].reveal()

    if dealerHand.score() > playerHand.score()
      Backbone.trigger "lose", @
    else if dealerHand.score() < 17
      dealerHand.hit()
    else if dealerHand.score() == playerHand.score()
      Backbone.trigger "push", @
    else
      Backbone.trigger "win", @

  gameOver: ->
    console.log "Game called .gameOver()"
    @startNewGame()
    Backbone.trigger 'gameOver', @
    console.log "Game transmitted gameOver"
