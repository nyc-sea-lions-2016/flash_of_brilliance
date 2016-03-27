user_count = 10
card1 = 20
card2 = 20
card3 = 20
card4 = 3
decks = 3


user_count.times do
  User.create(
    user_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "pw"
    )
  end

  card1.times do
    Card.create(
      question: Faker::Hacker.say_something_smart,
      answer: "answer",
      deck_id: 1
      )
  end

  card2.times do
    Card.create(
      question: Faker::Hipster.sentence,
      answer: "answer",
      deck_id: 2
      )
  end

  card3.times do
    Card.create(
      question: Faker::StarWars.quote,
      answer: "answer",
      deck_id: 3
      )
  end

  card4.times do
    Card.create(
      question: Faker::StarWars.quote,
      answer: "answer",
      deck_id: 4

      )
  end

  decks.times do
    Deck.create(
      name: Faker::Color.color_name,
      description:  Faker::Hipster.sentence
      )
  end

  Deck.create(
    name: 'Test Deck',
    description: "Testing shit since 2016")

