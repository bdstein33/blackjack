# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @startNewGame()
    console.log("A");
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
      # @gameOver()
    else if dealerHand.score() < 17
      dealerHand.hit()
      @stand()
    else if dealerHand.score() == playerHand.score()
      Backbone.trigger "push", @
      # @gameOver()
    else
      Backbone.trigger "win", @
      # @gameOver()





    # if dealerHand.score() > playerHand.score()
    #   # @determineWinner()
    #   # console.log("DEALER WINS")
    #   Backbone.trigger "lose", @
    #   @gameOver()
    # else if dealerHand.score() < 17
    #   dealerHand.hit()
    #   @stand()
    # else if dealerHand.score() === playerHand.score()
    #   determineWinner()
    # else
    #   console.log("PLAYER WINS")
    #   Backbone.trigger "win", @
    #   @gameOver()

  determineWinner: ->
    playerHand = @get 'playerHand'
    dealerHand = @get 'dealerHand'

    if dealerHand.score() > playerHand.score()
      if dealerHand.score() <= 21
        console.log("PLAYER LOSES")
        Backbone.trigger "lose", @
        @gameOver()
      else
        console.log("DEALER BUSTS")
        console.log("PLAYER WINS")
        Backbone.trigger "win", @
        Backbone.trigger "dealerBust", @
        @gameOver()
    else if dealerHand.score() < playerHand.score()
      console.log("PLAYER WINS")
      Backbone.trigger "win", @
      @gameOver()
    else
      console.log("PUSH")
      Backbone.trigger "push", @
      @gameOver()

  gameOver: ->
    console.log "Game called .gameOver()"
    @startNewGame()
    Backbone.trigger 'gameOver', @
    console.log "Game transmitted gameOver"
