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
