require "pry"

sentence = "How are you?"

sentence_modified = sentence.chars.reduce("") do |memo, char|
  if ['a', 'e', 'i', 'o', 'u'].include? (char)
    memo + char * 5
  else
    memo + char
  end
end

# sentece_modified = sentence.chars.reduce { |memo, char| (['a', 'e', 'i', 'o', 'u'].include? (char)) ? memo + char * 5 : memo + char}
puts sentence_modified
