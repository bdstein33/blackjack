- Models
  App
  Card

- Collections
  Deck --> model: Card
  Hand --> model: Card
    One for dealer
    One for player

- View
  AppView --> 2 x HandView
  HandView --> HandView (Player), HandView (Dealer)
  How do we display action???


- Logic
 Facedown card --> faceDown attribute on Card (only faceDown for dealer first card)
 
 Ace logic
  Default value is 11, if hand.value > 21, first ace with value 11 is changed to 1

- Actions
  Hit
    -on add, if hand value > 21, trigger 'busted'
    -on 'busted', reset game
  Stand
    - reveal facedown card


if dealer.value > player.value
  determineWinner()
else if dealer.value < 17
  dealer.hit -- > recurse
else if dealer.value >= 17 && dealer.value <= 21
  determineWinner()
else
  playerWins


determineWinner(){
  if dealer.value > player.value
    player loses
  else if dealer.value < player.value
    player wins
  else
    push
}

Methods
  determineWinner()
  playerWins()
  dealerWins()
  resetGame()