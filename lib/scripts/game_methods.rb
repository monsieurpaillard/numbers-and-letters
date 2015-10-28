# Ici toutes les méthodes liées à la logique du jeu
def generate_grid(grid_size)
  array = []
  for i in (1..grid_size)
   array << ('a'..'z').to_a.shuffle[0,1]
  end
  array
end

def run_game(attempt, grid, start_time, end_time)
  result = {}
  result[:time] = end_time - start_time
  result[:translation] = translate(attempt)
  result[:score] = score(attempt, start_time, end_time)
  result[:message] = translate(attempt)
  result
end

def score(attempt, start_time, end_time)
  a = attempt.length + 100
  b = end_time - start_time + 100
  c = a + b
end


def translate(word)
  api_url = "http://api.wordreference.com/0.8/80143/json/enfr/#{word}"
  open(api_url) do |stream|
    translation = JSON.parse(stream.read)
    if translation["Error"] == "NoTranslation"
      return nil
    elsif translation["Response"] == "Redirect"
      return "not an english word"
    else
    translation['term0']['PrincipalTranslations']['0']['FirstTranslation']['term']
    end
  end
end
