# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Info extends Backbone.Model
  initialize: (params) ->
    @set 'parent', params.parent
    # @test()
    return

  defaults:
    text: "Welcome to BlackJack :-)"

  # test: ->
    # console.log @get('parent').get('dealerHand').last()
