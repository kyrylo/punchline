require "minitest_helper"

describe LyricsHelper do
  let(:text) { "Can you\nfeel it?" }
  let(:line) { text.split("\n").first }
  let(:word) { text.split(' ').first }

  describe "#build_granular_lyric_for" do
    it "must wrap every word in the text with HTML span tags" do
      build_granular_lyric_for(text)
        .must_equal '<p><span class="lyric_word">Can</span> ' +
                    '<span class="lyric_word">you</span>'     +
                    "\n" + '<br />'                           +
                    '<span class="lyric_word">feel</span> '   +
                    '<span class="lyric_word">it?</span></p>'
    end
  end

  describe "#with_each_line_in" do
    it "must iterate through each line in the given text" do
      with_each_line_in(text) do |line|
        line + ' bong'
      end.must_equal "Can you\n bong\nfeel it? bong"
    end

    it "must leave given text unchanged if no block provided" do
      with_each_line_in(text).must_equal "Can you\nfeel it?"
    end
  end

  describe "#with_each_word_in" do
    it "must iterate through each word in the given text" do
      with_each_word_in(line) do |word|
        word + ' bong'
      end.must_equal "Can bong you bong"
    end

    it "must leave given words unchanged if no block provided" do
      with_each_word_in(line).must_equal "Can you"
    end
  end
end
