json.array!(@hangmen) do |hangman|
  json.extract! hangman, :solution, :title, :puzzle
  json.url hangman_url(hangman, format: :json)
end
