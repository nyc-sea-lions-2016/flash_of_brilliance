class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards
  has_many :games
  has_many :users, through: :games
end
