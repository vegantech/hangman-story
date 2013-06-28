json.array!(@games) do |game|
  json.extract! game, :moves, :hangman_id
  json.url game_url(game, format: :json)
end
