# post '/games/:id/guesses' do
#   @user = User.find(session[:user_id])
#   @deck = Deck.find(params[:id])
#   idx = session[:indexes].first
#   if !session[:indexes].empty?
#     @card = Card.find(idx)
#     @game = Game.find(session[:game_id])
#     @guess = Guess.create(card_id: @card.id, game_id: session[:game_id])
#       if @card.answer == params[:answer]
#         session[:indexes].shift


#         erb :"games/show"
#       else


#         erb :"games/show"
#       end

#   else
#     redirect "/users/#{session[:user_id]}"
#   end

# end

    # @game.increment!(:total_guesses)

        # @guess.increment!(:guess_count)
        # @game.increment!(:num_correct)

        # if @guess.guess_count < 2
        #   # @game.increment!(:first_try_count)
        # end


       # @guess.increment!(:guess_count)
        # @game.increment!(:num_incorrect)

  # erb :'games/show'
