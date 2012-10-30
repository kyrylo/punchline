# coding: utf-8

require "minitest_helper"

describe ContractedSentence do
  describe "self.convert" do
    it "should convert an Array of 1 element correctly" do
      words = ['прекрасный']
      ContractedSentence.convert(words).must_equal 'прекрасный'
    end

    it "should convert an Array of 2 elements correctly" do
      words = ['прекрасный', 'великолепный']
      ContractedSentence.convert(words).must_equal 'прекрасный и великолепный'
    end

    it "should convert an Array of 3 or more elements correctly" do
      words = ['прекрасный', 'великолепный', 'очаровательный', 'изумительный']
      sentence = ContractedSentence.convert(words)
      sentence.must_equal 'прекрасный, великолепный, очаровательный и изумительный'
    end
  end
end
