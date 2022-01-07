# using http gem, allows us to send web requests in ruby
# gem: packet of ruby code
require "http" 

puts "Welcome to Ro's Super Accurate Dictionary"
puts "Please enter a word for its definition, top example, and pronounciation: "
word = gets.chomp

def_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=03pgsw5yqhr4za5ql3604lcnwwdhwyznzog38048pue6ca6qy")

word_data = def_response.parse(:json)

definition = word_data[0]["text"]

puts ""
puts definition

#pronounciation
pronounciation_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=03pgsw5yqhr4za5ql3604lcnwwdhwyznzog38048pue6ca6qy")
pronounciation_data = pronounciation_response.parse(:json)
pronounciation = pronounciation_data[0]["raw"]

puts ""
puts "Pronounciation: #{pronounciation}"

#top example
sentence_response = HTTP.get"https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=03pgsw5yqhr4za5ql3604lcnwwdhwyznzog38048pue6ca6qy"
sentence_data = sentence_response.parse(:json)
sentence = sentence_data["text"]

puts ""
puts "Example sentence: #{sentence}"