using Printf

import Base: show, isless, pop!, push!, sort!
import Random: shuffle!


# Defining abstract types (supertype for all card subtypes)

abstract type CardSet end

# Card Functions

const suit_names = ["Cross", "Diamond", "Heart", "Spade"]
const rank_names = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

# Cross: 1, Diamond: 2, Heart: 3, Peak: 4
struct Card
  suit::Int64
  rank::Int64
  function Card(suit::Int64, rank::Int64)
    @assert(1 <= suit <= 4, "The card's suite has to be between 1 and 4")
    @assert(1 <= rank <= 13, "The card's rank had to be between 1 and 13")
    return new(suit, rank)
  end
end

function Base.show(io::IO, card::Card)
  print(io, suit_names[card.suit] * rank_names[card.rank])
end

function isless(c1::Card, c2::Card)
  return (c1.suit, c1.rank) < (c2.suit, c2.rank)
end

# Deck Functions

struct Deck <: CardSet
  cards::Array{Card, 1}
end

function Deck()
  deck = Deck([])
  for (i, suit) in enumerate(suit_names)
    for (j, rank) in enumerate(rank_names)
      push!(deck, Card(i, j))
    end
  end
  return deck
end

# Hand of cards

struct Hand <: CardSet
  cards::Array{Card, 1}
  label::String
end

function Hand(label::String="")
  return Hand(Card[], label)
end

# Common CardSet operations
function Base.show(io::IO, cs::CardSet)
  for card in cs.cards
    print(io, card, " ")
  end
  println()
end

# draw a card
function pop!(cs::CardSet)
  return pop!(cs.cards)
end

# add a card
function push!(cs::CardSet, card::Card)
  push!(cs.cards, card)
  return nothing
end

# shuffle deck
function shuffle!(cs::CardSet)
  shuffle!(cs.cards)
  return cs
end

# sort deck by suite then rank
function sort!(cs::CardSet)
  sort!(cs.cards)
  return cs
end

# draw `n` number of cards from cardset 1 and add them to cardset 2
function move!(cs1::CardSet, cs2::CardSet, n::Int)
  @assert 1 <= n <= length(cs1.cards)
  for i in 1:n
    push!(cs2, pop!(cs1))
  end
  return nothing
end



# Test functionality
deck = Deck()
@show deck
shuffle!(deck)
@show deck
card = pop!(deck)
@show deck
push!(deck, card)
@show deck
sort!(deck)
@show deck
hand = Hand("Jan's Hand")
move!(deck, hand, 5)
sort!(hand)
@show hand
