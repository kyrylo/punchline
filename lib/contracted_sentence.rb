# coding: utf-8

# По-русски именуется (я так полагаю) предложением с однородными членами.
module ContractedSentence
  # Converts an Array of +words+ to a contracted sentence.
  # @example
  #   ContractedSentece.convert(["Восхитительный", "превосходный", "отличный"])
  #   #=> "Восхитительный, превосходный и отличный"
  # @param [Array] words The words to be concatenated into a sentence
  # @return [String] the sentence with homogenous parts
  def self.convert(words)
    last_word = words.last
    words.inject do |sentence, word|
      sentence + (word == last_word ? ' и ' : ', ') + word
    end
  end
end
