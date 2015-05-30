# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @startNewGame()
    @listenTo Backbone, 'busted', @startNewGame
    return

  startNewGame: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer(model: @model)
    @set 'dealerHand', deck.dealDealer(model: @model)
    @set 'info', info = new Info()
    return

  stand: ->
    playerHand = @get 'playerHand'
    dealerHand = @get 'dealerHand'
    dealerHand.models[0].reveal()


    if dealerHand.score() > playerHand.score()
      @determineWinner()
      console.log("DEALER WINS")
      @gameOver()
    else if dealerHand.score() < 17
      dealerHand.hit()
      @stand()
    else
      console.log("PLAYER WINS")
      @gameOver()

  determineWinner: ->
    playerHand = @get 'playerHand'
    dealerHand = @get 'dealerHand'

    if dealerHand.score() > playerHand.score()
      if dealerHand.score() <= 21
        console.log("PLAYER LOSES")
        @gameOver()
      else
        console.log("DEALER BUSTS")
        console.log("PLAYER WINS")
        @gameOver()
    else if dealerHand.score() < playerHand.score()
      console.log("PLAYER WINS")
      @gameOver()
    else
      console.log("PUSH")
      @gameOver()

  gameOver: ->
    @startNewGame()
    Backbone.trigger('gameOver', this);
