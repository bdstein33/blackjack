# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @startNewGame()
    @set 'info', info = new Info(parent: @)
    @listenTo Backbone, 'playerBust dealerBust lose push win', @gameOver
    return

  startNewGame: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer(model: @model)
    @set 'dealerHand', deck.dealDealer(model: @model)
    Backbone.trigger "newGame", @
    return

  stand: ->
    playerHand = @get 'playerHand'
    dealerHand = @get 'dealerHand'
    dealerHand.models[0].reveal()
    if dealerHand.score() > playerHand.score()
      Backbone.trigger "lose", @
    else
      while dealerHand.score() < 17
        if dealerHand.score() < playerHand.score()
          dealerHand.hit()

      if dealerHand.score() <= 21
        if dealerHand.score() == playerHand.score()
          Backbone.trigger "push", @
        else if dealerHand.score() < playerHand.score()
          Backbone.trigger "win", @
        else
          Backbone.trigger "lose", @

  gameOver: ->
    Backbone.trigger 'gameOver', @

