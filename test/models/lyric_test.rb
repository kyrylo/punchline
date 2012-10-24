require "minitest_helper"

describe Lyric do
  before do
    @lyric = Lyric.new
  end

  it "must be valid" do
    @lyric.valid?.must_equal true
  end
end
