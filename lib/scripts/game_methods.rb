require 'open-uri'
require 'json'

def generate_grid(grid_size)
  array = []
  for i in (1..grid_size)
   array << ('a'..'z').to_a.shuffle[0,1]
  end
  array
end

def find_on_wordreference(word)
    api_url = "http://api.wordreference.com/0.8/80143/json/enfr/#{word}"
    open(api_url) do |stream|
      translation = JSON.parse(stream.read)
      if translation["Error"] == "NoTranslation"
        return nil
      elsif translation["Response"] == "Redirect"
        return "not an english word"
      else
        return translation['term0']['PrincipalTranslations']['0']['FirstTranslation']['term']
    end
  end
end

def in_grid?(word,grid)
  grid = generate_grid(grid)

end
