class window.InfoView extends Backbone.View

  className: 'game-info-container'

  tagName: 'div'

  initialize: ->
    console.log @
    @listenTo Backbone, 'playerBust', @playerBustedRender
    @listenTo Backbone, 'dealerBust', @dealerBustedRender
    @listenTo Backbone, 'playerHit', @playerHitRender
    @listenTo Backbone, 'dealerHit', @dealerHitRender
    @listenTo Backbone, 'stand', @playerStandRender
    @listenTo Backbone, 'win', @playerWinRender
    @listenTo Backbone, 'lose', @playerLoseRender
    @listenTo Backbone, 'push', @playerPushRender
    @initializeRender()

  initializeRender: ->
    console.log @el
    @$el.append '<p class="info-text">Welcome to Blackjack!</p>'
    return

  playerHitRender: ->
    @$el.append '<p class="info-text">You Hit</p>'
    return

  dealerHitRender: ->
    @$el.append '<p class="info-text">Dealer Hit</p>'
    return

  playerBustedRender: ->
    @$el.append '<p class="info-text">You Busted</p>'
    @$el.append '<p class="info-text">----------------</p>'
    return

  playerWinRender: ->
    @$el.append '<p class="info-text">You Won</p>'
    @$el.append '<p class="info-text">----------------</p>'
    return

  playerLoseRender: ->
    @$el.append '<p class="info-text">You Lost</p>'
    @$el.append '<p class="info-text">----------------</p>'
    return

  playerPushRender: ->
    @$el.append '<p class="info-text">You and Dealer Pushed</p>'
    @$el.append '<p class="info-text">----------------</p>'
    return

  dealerBustedRender: ->
    @$el.append '<p class="info-text">Dealer Busted</p>'
    return

  playerStandRender: ->
    @$el.append '<p class="info-text">You Stood</p>'
    return

  # endGameRender: ->
  #   console.log "InfoView heard gameOver"

  #   return


