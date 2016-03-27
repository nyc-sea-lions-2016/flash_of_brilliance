 post '/games/:id/guesses' do
  @user = User.find(session[:user_id])
  @game = Game.find(params[:id])
  session[:game_id] = @game.id
  idx = session[:indexes].first
  @card = Card.find(idx)
  @guess = Guess.create(card_id: @card.id, game_id: @game.id)
  @game.increment!(:total_guesses)
  if @card.answer == params[:answer]
    @guess.increment!(:guess_count)
    @game.increment!(:num_correct)
    if @guess.guess_count < 2
       @game.increment!(:first_try_count)
    end
    session[:indexes].shift
  else
    @guess.increment!(:guess_count)
    @game.increment!(:num_incorrect)
  end
  if session[:indexes].empty?
    redirect "/users/#{@user.id}"
  else
    redirect "/games/#{@game.id}"
  end

 end






  # erb :'games/show'
