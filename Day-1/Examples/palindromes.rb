def is_palindrome? sentence
  @clean_sentence = sentence.downcase.gsub(/[.,;:\s]/, '')
  @clean_sentence == @clean_sentence.reverse
end

puts is_palindrome? "dad"
puts is_palindrome? "noon"
puts is_palindrome? "anna"
puts is_palindrome? "step on no pets"
puts is_palindrome? "race car"
puts is_palindrome? "Satan oscillate my metallic sonatas"
puts is_palindrome? "On a clover, if alive, erupts a vast pure evil; a fire volcano"


def is_word_palindrome? sentence
  @words = sentence.downcase.gsub(/[.,;:]/, '').split
  @words == @words.reverse
end

puts is_word_palindrome? "Fall leaves as soon as leaves fall"
