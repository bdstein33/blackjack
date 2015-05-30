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

- Update InfoModel and, consequentially, InfoView
- Add New Game / Start Functionality
- Add Instant Win for player blackjack
- Add NoGameView
- GameOver Event
- Splitting?
- Betting?


gameOver
newGame
busted
lose
win
push
hit
stand
