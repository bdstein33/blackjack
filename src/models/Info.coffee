# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Info extends Backbone.Model
  initialize: (params) ->
    @set
      text: "Welcome to BlackJack :-)"

