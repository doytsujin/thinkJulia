# Read function
# struct WordHistogram
#   label::String
#   totalWordCount::Number
#   uniqueWordCounts::Dict{String, Number}
# end

function main(text::String)
  # Trim of header
  (header, content) = split(text, r"\*+[\w0-9\s]+\*+")
  text = nothing # free large string
  header = nothing
  # Split text at whitespace or linebreak
  #  returns array of words 
  contentArray = split(content, r"[\n\s]+")
  filter!(!isempty, contentArray)
  content = nothing
  # Trim words to only include alphabetic char
  # turn all words lowercase
  # new wordOnlyArray manipulation
  wordArray = map(str -> lowercase(replace(str, r"[^\w]"=>"")), contentArray)
  contentArray = nothing
  # reduce array and fill WordHistogram
  # pass in WordHistogram struct and array 
  wordHistogram = Dict{String, Any}(
    "totalWordCount" => 0, 
    "uniqueWordCounts" => Dict{String, Int64}()
  )
  for word in wordArray
    wordHistogram["totalWordCount"] += 1
    wordHistogram["uniqueWordCounts"][word] = get(wordHistogram["uniqueWordCounts"], word, 0) + 1
  end 
  println(wordHistogram["totalWordCount"])
  println("Gender Pronoun Ratio (GPR): $(get(wordHistogram["uniqueWordCounts"], "he", 0)/get(wordHistogram["uniqueWordCounts"], "she", 1))")
end

# Import txt file and feed to main

# text = open("books/The_Adventures_of_Sherlock_Holmes_by_Arthur_Conan_Doyle.txt") do file
#   read(file, String)
# end

text = open("books/pg10.txt") do file
  read(file, String)
end

@time main(text)