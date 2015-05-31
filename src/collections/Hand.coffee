class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    return

  hit: ->

    if @isDealer
      Backbone.trigger 'dealerHit'
    else
      Backbone.trigger 'playerHit'

    Backbone.trigger @.toString + 'hit', @
    @add(@deck.shift())
    @checkScore()

    return

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1 and card.get 'revealed'
  , 0

  # minScore: -> @reduce (score, card) ->
  #   score + if card.get 'revealed' then card.get 'value' else 0
  # , 0

  maxScore: ->
    minScore = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0

    if @hasAce() and minScore <= 11
      return minScore + 10

    return minScore


  score: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.

    # [@minScore(), @minScore() + 10 * @hasAce()]
    @maxScore()

  checkScore: ->

    if @maxScore() > 21
        if @isDealer
          Backbone.trigger 'dealerBust', @
          Backbone.trigger "win", @
        else
          Backbone.trigger 'playerBust', @
          Backbone.trigger "lose", @

    return
