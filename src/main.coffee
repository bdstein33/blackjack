# $(document).ready(function(){

#   new AppView(model: new App()).$el.appendTo('.game-containter')

# });


$(document).ready ->
  new AppView(model: new App()).$el.appendTo('.game-container')



